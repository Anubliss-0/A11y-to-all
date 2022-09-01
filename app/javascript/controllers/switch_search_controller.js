import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch-search"
export default class extends Controller {
  static targets = ["searchtools", "searchusers", "users", "tools"]
  connect() {
    console.log("Switch-search controller connected.")
  }
  switch() {
    console.log('click')
    if (this.usersTarget.checked) {
      this.searchusersTarget.classList.remove("hiding")
      this.searchtoolsTarget.classList.add("hiding")
    } else if (this.toolsTarget.checked) {
      console.log(this.searchusersTarget)
      this.searchusersTarget.classList.add("hiding")
      this.searchtoolsTarget.classList.remove("hiding")
    }
  }
}
