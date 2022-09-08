import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profpreview"
export default class extends Controller {
  static targets = ["preview"]
  connect() {
    console.log("profpreview connected")
  }


  preview(event) {
    this.previewTarget.innerHTML = ``
    let name = (event.currentTarget.querySelector("#name").innerText)
    let bio = (event.currentTarget.querySelector("#bio").innerText)
    let image = (event.currentTarget.querySelector("#image").src)
    let score = (event.currentTarget.querySelector("#score").innerText)
    let userLink = (event.currentTarget.querySelector("#user-path")).href
    let chatButton = (event.currentTarget.querySelector(".prof-chat-card")).href


    this.previewTarget.innerHTML +=
    `
      <h2>${name}</h2>
      <div class ="prof-image-contain">
        <img src="${image}" alt="profile image" class="profile-avatar">
      </div>
      <p class="previewscore">Score - ${score}</p>
      <div class="text">
        <p>${bio}</p>
      </div>
      <div class="preview-buttons">
        <a class="button1" href="${userLink}">View Profile</a>
        <a class="button1" href="${chatButton}">Chat With User</a>
      </div>
    `
  }
}
