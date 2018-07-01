import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "slide" ];

  initialize() {
    this.showSlide(0)
  }

  answered(){
    var injection = document.getElementById('answered_badge');
    var alertSpot = document.getElementById('success-badges');
    var answerSection = this.element.parentNode.parentNode.querySelector("#success-badges");
    answerSection.insertAdjacentHTML('afterbegin', '<span class="badge badge-success" id="answered_badge">answered</span>');
  }

  revised(){
    var injection = document.getElementById('revised_badge');
    var alertSpot = document.getElementById('success-badges');
    var answerSection = this.element.parentNode.parentNode.querySelector("#success-badges");
    answerSection.insertAdjacentHTML('beforeend', '<span class="badge badge-success" id="revised_badge">revised</span>');
  }

  close() {
   this.element.parentNode.classList.remove("show")
  }

  next() {
    this.showSlide(this.index + 1)
  }

  previous() {
    this.showSlide(this.index - 1)
  }

  showSlide(index) {
    this.index = index
    this.slideTargets.forEach((el, i) => {
      el.classList.toggle("slide--current", index == i)
    })
  }
}

// if index is the last one, then toggleClassList to close the collapse
