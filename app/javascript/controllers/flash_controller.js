import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  static targets = ["flash"]
  connect() {
    console.log("flash controller connected")
    setTimeout(() => {this.flashTarget.classList.add("hiding")}, 3000)
  }
}
