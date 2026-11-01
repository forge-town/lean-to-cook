import { createRoot } from "react-dom/client";
import { AdminApp } from "./components/AdminApp";
import "./styles.css";
const root = document.querySelector("#root");
if (!root) throw new Error("Application root is missing");
createRoot(root).render(<AdminApp />);
