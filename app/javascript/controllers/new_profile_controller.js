import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="new-profile"
export default class extends Controller {
  connect() {
    console.log("Hello there!");
    let nxtButtons = document.querySelectorAll(`.next`);
    let prvButtons = document.querySelectorAll(`.prev`);

    nxtButtons.forEach((nextbtn) => {
      nextbtn.addEventListener(`click`, function () {
        this.parentElement.classList.toggle("hiding")
        this.parentElement.nextElementSibling.classList.toggle("hiding")
      });
    });

    prvButtons.forEach((prevbtn) => {
      prevbtn.addEventListener(`click`, function () {
        this.parentElement.classList.toggle("hiding")
        this.parentElement.previousElementSibling.classList.toggle("hiding")
      });
    });
  }

  next(event) {
    console.log("I hear you!");

  }
}

//Set a visability style to cause it to fade, then set a short timer before
// triggering hidden between parent elements
