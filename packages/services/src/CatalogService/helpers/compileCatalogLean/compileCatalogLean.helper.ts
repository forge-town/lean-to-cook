import { spawn } from "node:child_process";
import { Result } from "neverthrow";
import { leanProjectRoot } from "../loadLeanModel/loadLeanModel.helper";
import { CatalogServiceError } from "../../Catalog.service.error";
const execute = (args: string[], input = ""): Promise<string> =>
  new Promise((resolve, reject) => {
    const child = spawn("lake", args, {
      cwd: leanProjectRoot,
      detached: process.platform !== "win32",
      stdio: "pipe",
    });
    const execution = { output: "", expired: false, oversized: false };
    const stop = () => {
      if (child.pid && process.platform !== "win32")
        Result.fromThrowable(() => process.kill(-child.pid!, "SIGKILL"))();
      else child.kill("SIGKILL");
    };
    const timer = setTimeout(() => {
      execution.expired = true;
      stop();
    }, 60_000);
    const collect = (text: string) => {
      if (execution.oversized) return;
      execution.output += text;
      if (Buffer.byteLength(execution.output) > 2 * 1024 * 1024) {
        execution.oversized = true;
        stop();
      }
    };
    child.stdout.setEncoding("utf8").on("data", collect);
    child.stderr.setEncoding("utf8").on("data", collect);
    child.on("error", (error) => {
      clearTimeout(timer);
      stop();
      reject(new CatalogServiceError("CONFLICT", "Lean 工具链不可用", error));
    });
    child.on("close", (code) => {
      clearTimeout(timer);
      if (code === 0 && !execution.expired && !execution.oversized)
        resolve(execution.output.trim());
      else
        reject(
          new CatalogServiceError(
            "CONFLICT",
            execution.expired
              ? "Lean 校验超时，请重试"
              : execution.oversized
                ? "Lean 校验输出过长"
                : `Lean 校验未通过：\n${execution.output.trim().slice(0, 1400)}`,
          ),
        );
    });
    child.stdin.on("error", () => {
      /* Process exit is reported by close/error. */
    });
    child.stdin.end(input);
  });
const queue = { tail: Promise.resolve() };
export const compileCatalogLean = (sources: string[]): Promise<{ leanVersion: string }> => {
  const task = queue.tail.then(async () => {
    await execute(["build", "LeanToCook.DataContracts.Recipes"]);
    const leanVersion = await execute(["env", "lean", "--version"]);
    const combined = [
      "import LeanToCook.DataContracts.Recipes",
      ...sources.map((source) =>
        source.replace(/^import LeanToCook\.DataContracts\.Recipes\n/, ""),
      ),
    ].join("\n");
    await execute(
      ["env", "lean", "-M", "512", "-j", "2", "-DwarningAsError=true", "--stdin"],
      combined,
    );

    return { leanVersion };
  });
  queue.tail = task.then(
    () => undefined,
    () => undefined,
  );

  return task;
};
