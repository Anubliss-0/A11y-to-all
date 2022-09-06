import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="external"
export default class extends Controller {
  static targets = ["popup"]
  connect() {
    console.log("Hello from external Links!")
  }

  popup() {
    console.log("detected")
    this.popupTarget.classList.remove("hiding")
    this.popupTarget.style.display = "flex";
  }

  close() {
    console.log("closing...")
    this.popupTarget.style.display = "none";
  }
}
