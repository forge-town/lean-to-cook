import type { CookingAction } from "@repo/schemas";
export const isWashingAction = (actions?: CookingAction[]) =>
  !!actions?.includes("wash") &&
  actions.every((action) => ["wash", "drain", "soak"].includes(action));
