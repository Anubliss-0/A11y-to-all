import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="blackout"
export default class extends Controller {
  connect() {
    console.log("Hello from Blackout controller!")
  }

  blackout() {

  }
}
