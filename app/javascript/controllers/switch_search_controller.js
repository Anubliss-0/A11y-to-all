import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch-search"
export default class extends Controller {
  static targets = ["searchtools", "searchusers", "users", "tools", "togglebg", "avatar"]
  connect() {
    console.log("Switch-search controller connected.")
    const blackout = document.querySelector(".blackout")
  }

  switch() {
    console.log('click')
    if (this.usersTarget.checked) {
      this.searchusersTarget.classList.remove("hiding")
      this.searchtoolsTarget.classList.add("hiding")
      this.togglebgTarget.classList.add("highlight-users")
    } else if (this.toolsTarget.checked) {
      this.searchusersTarget.classList.add("hiding")
      this.searchtoolsTarget.classList.remove("hiding")
      this.togglebgTarget.classList.remove("highlight-users")
    }
  }

}
