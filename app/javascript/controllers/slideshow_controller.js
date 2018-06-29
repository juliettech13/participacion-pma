import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "slide" ];

  initialize() {
    this.showSlide(0)
  }

  answered(){
    var injection = document.getElementById('revised_badge')
    var alertSpot = document.getElementById('success-badges')
    var answeredSection = this.element.parentNode.parentNode
  }

  revised(){
    var injection = document.getElementById('revised_badge')
    var injection = document.getElementById('answered_badge')
    var alertSpot = document.getElementsByClassName('success-badges')

    console.log(this.element.parentNode.parentNode)

    // alertSpot.innerHTML = injection
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
