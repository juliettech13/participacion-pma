import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "slide" ]

initialize() {
    this.showSlide(1)
  }

  yes() {
    this.showSlide(this.index + 1)
  }

  no() {
    this.showSlide(this.index + 1)
  }

  skip() {
    this.showSlide(this.index + 1)
  }

 showSlide(index) {
    this.index = Question.id
    this.slideTargets.forEach((el, i) => {
      el.classList.toggle("slide--current", index == i)
    })
  }
}
