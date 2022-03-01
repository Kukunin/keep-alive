import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["emptyState", "item"];

  connect() {
    this.observer = new MutationObserver(this.update.bind(this));
    this.observer.observe(this.element, {
      childList: true,
      attributes: false,
      subtree: true
    });
    this.update();
  }

  disconnect() {
    this.observer.disconnect();
  }

  update() {
    this.emptyStateTarget.classList.toggle("hidden", this.itemTargets.length !== 0);
  }
}
