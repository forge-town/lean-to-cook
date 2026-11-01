// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { FinishedDish } from "./FinishedDish";
import { potatoSceneAt } from "../sceneFixtures";
afterEach(cleanup);
it("plates the recipe solids as cooked ingredients and supports drink vessels", () => {
  const scene = potatoSceneAt(6);
  const { rerender } = render(<FinishedDish scene={scene} />);
  const plate = screen.getByRole("img", { name: "拔丝土豆成品构成" });
  expect(plate.querySelectorAll('[data-state="cooked"]').length).toBeGreaterThan(0);
  expect(plate.querySelector('[data-kind="oil"]')).toBeNull();
  rerender(
    <FinishedDish scene={{ ...scene, recipeTitle: "奶茶", dishForm: "cup", allIngredients: [] }} />
  );
  expect(screen.getByRole("img", { name: "奶茶成品构成" })).toBeTruthy();
});
