import { useLogin } from "@refinedev/core";
import { LoginPageStoreProvider } from "./_store";
import { LoginPageContent } from "./_components/LoginPageContent";
export const LoginPage = () => {
  const login = useLogin();

  return (
    <LoginPageStoreProvider login={login.mutateAsync}>
      <LoginPageContent />
    </LoginPageStoreProvider>
  );
};
