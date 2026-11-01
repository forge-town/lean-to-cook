export const paneResizeDom = {
  measure: (element: HTMLDivElement) =>
    element.closest("[data-workspace]")?.getBoundingClientRect(),
  capture: (element: HTMLDivElement, pointerId: number) => {
    element.focus();
    element.setPointerCapture(pointerId);
  },
  release: (element: HTMLDivElement, pointerId: number) => {
    if (element.hasPointerCapture(pointerId)) element.releasePointerCapture(pointerId);
  },
};
