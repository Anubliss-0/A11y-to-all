import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="preview"
export default class extends Controller {
  static targets = ["preview"]
  connect() {
    console.log("preview connected")
  }

  preview(event) {
    this.previewTarget.innerHTML = ``
    let name = (event.currentTarget.querySelector("#name").innerText)
    let description = (event.currentTarget.querySelector("#description").innerText)
    let username = (event.currentTarget.querySelector("#username").innerText)
    let rating = (event.currentTarget.querySelector("#rating").innerText)
    let image = (event.currentTarget.querySelector("#image").src)
    let toolPath = (event.currentTarget.querySelector("#tool-path")).href
    let toolBoxLink = (event.currentTarget.querySelector("#toolbox-path")).href
    let userLink = (event.currentTarget.querySelector("#user-path")).href
    let categories = (event.currentTarget.querySelectorAll("#category"))
    console.log(categories)
    let tmp = "";
    categories.forEach(category => {
      tmp += `<span>${category.innerText}</span>`
    })
    this.previewTarget.innerHTML +=
    `
      <h2>${name}</h2>
      <img src="${image}">
      <div class="text">
        <p>${description}</p>
      </div>
      <div class="preview-buttons">
        <a class="button1" href="${toolPath}">View tool</a>
        <a class="button2" href="${toolBoxLink}">Add to toolkit</a>
      </div>
      <div class= "categories">
        ${tmp}
      </div>
      <div class="submit-details">
        <span>submitted by <a href="${userLink}">${username}</a></span>
        <span>${rating > 0 ? "★".repeat(rating) : "no ratings...yet!"}</span>
      </div>
    `
  }

}
