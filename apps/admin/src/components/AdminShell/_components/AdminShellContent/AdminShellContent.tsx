import type { ReactNode } from "react";
import { Button } from "@repo/ui/button";
import { Landmark } from "../../../ui/Landmark";
import { Typography } from "../../../ui/Typography";
import { Anchor } from "../../../ui/Anchor";
import { catalogHref } from "../../../../lib/navigation";
import { resources, type AdminLocation } from "../../../../lib/resources";
import { clientEnvironment } from "../../../../integrations/env/clientEnvironment";
import { useAdminShellStore } from "../../_store";
export const AdminShellContent = ({
  location,
  children,
  logoutFailed = false,
  recordName,
  recordFailed = false,
}: {
  location: AdminLocation;
  children: ReactNode;
  logoutFailed?: boolean;
  recordName?: string;
  recordFailed?: boolean;
}) => {
  const handleLogoutButtonClick = useAdminShellStore((s) => s.handleLogoutButtonClick);
  const handleHeaderActionsRefChange = useAdminShellStore((s) => s.handleHeaderActionsRefChange);
  const label = resources.find((r) => r.name === location.resource)!.label;
  const notices: Record<string, string> = {
    saved: "修改已保存",
    deleted: "记录已删除",
    published: "当前版本已发布",
    unpublished: "已取消发布",
  };

  return (
    <div className="admin-layout">
      <Landmark as="aside" className="sidebar">
        <Anchor className="brand" href="/recipes">
          <Typography as="span" className="brand-icon">
            L/c
          </Typography>
          <div>
            <Typography className="brand-wordmark">
              Lean to Cook
              <Typography as="span" className="brand-dot">
                .
              </Typography>
            </Typography>
            <Typography className="brand-caption">内容后台</Typography>
          </div>
        </Anchor>
        <div className="sidebar-rule" />
        <Typography className="nav-caption">内容</Typography>
        <Landmark aria-label="管理菜单" as="nav" className="sidebar-nav">
          {resources.map((item) => (
            <Anchor
              key={item.name}
              aria-current={location.resource === item.name ? "page" : undefined}
              className={location.resource === item.name ? "nav-item active" : "nav-item"}
              href={catalogHref(item.name)}
            >
              {item.label}
            </Anchor>
          ))}
        </Landmark>
        <div className="sidebar-bottom">
          <Anchor
            className="site-link"
            href={clientEnvironment.VITE_PUBLIC_SITE_URL}
            rel="noreferrer"
            target="_blank"
          >
            打开前台 ↗
          </Anchor>
        </div>
      </Landmark>
      <div className="workspace">
        <Landmark as="header" className="workspace-header">
          <Landmark aria-label="面包屑" as="nav" className="breadcrumb">
            {location.id ? (
              <>
                <Anchor href={catalogHref(location.resource)}>{label}</Anchor>
                <Typography aria-hidden="true" as="span">
                  /
                </Typography>
                <Typography
                  aria-current="page"
                  as="span"
                  className="breadcrumb-current"
                  title={recordName}
                >
                  {location.id === "new"
                    ? "新增"
                    : recordFailed
                      ? "读取失败"
                      : (recordName ?? "正在读取…")}
                </Typography>
              </>
            ) : (
              <Typography aria-current="page" as="h1" className="header-title">
                {label}
              </Typography>
            )}
          </Landmark>
          <div className="button-row">
            {!location.id && (
              <Anchor className="primary-link" href={catalogHref(location.resource, { id: "new" })}>
                ＋ 新增{label}
              </Anchor>
            )}
            <div ref={handleHeaderActionsRefChange} className="page-header-actions" />
            <Typography className="workspace-label">管理员</Typography>
            <Button size="sm" variant="ghost" onClick={handleLogoutButtonClick}>
              退出
            </Button>
          </div>
        </Landmark>
        <Landmark className="workspace-main">
          {logoutFailed && (
            <div className="error-banner" role="alert">
              退出失败，请重试。
            </div>
          )}
          {notices[location.notice] && (
            <div className="success-banner" role="status">
              ✓ {notices[location.notice]}
            </div>
          )}
          {children}
        </Landmark>
        <Landmark as="footer" className="workspace-footer">
          <Typography>Lean to Cook</Typography>
        </Landmark>
      </div>
    </div>
  );
};
