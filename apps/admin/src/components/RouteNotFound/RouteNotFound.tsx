import { Anchor } from "../ui/Anchor";
import { Typography } from "../ui/Typography";
export const RouteNotFound = () => (
  <div className="error-banner" role="alert">
    <Typography as="h1">页面不存在</Typography>
    <Anchor href="/recipes">返回菜谱</Anchor>
  </div>
);
