import type { PropsWithChildren } from "react";

import type { StoryModuleInfo } from "./storyModuleCatalog";

interface StoryModuleFrameProperties extends PropsWithChildren {
  moduleInfo: StoryModuleInfo | undefined;
}

export const StoryModuleFrame = ({ children, moduleInfo }: StoryModuleFrameProperties) => {
  if (!moduleInfo) return children;

  return (
    <div className="sb-module-frame">
      <header className="sb-module-frame__header">
        <div className="sb-module-frame__identity">
          <span>{moduleInfo.tier} module</span>
          <strong>{moduleInfo.title}</strong>
          <p>{moduleInfo.summary}</p>
        </div>
        <div className="sb-module-frame__paths">
          <span>React / frontend</span>
          <ul>
            {moduleInfo.frontendFiles.map((file) => (
              <li key={file}>
                <code>{file}</code>
              </li>
            ))}
          </ul>
        </div>
        <div className="sb-module-frame__route">
          <span>Route / Lean</span>
          <code>{moduleInfo.route}</code>
          {moduleInfo.leanFiles.map((file) => (
            <code key={file}>{file}</code>
          ))}
          <p>
            {moduleInfo.leanFiles.length > 0
              ? "页面与 Lean 证明文件已建立映射。"
              : "纯前端可视化模块。"}
          </p>
        </div>
      </header>
      <div className="sb-module-frame__canvas">{children}</div>
    </div>
  );
};
