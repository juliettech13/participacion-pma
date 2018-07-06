import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "slide" ];

  initialize() {
    this.showSlide(0)
  }

  answered(){
    var injection = document.getElementById('answered_badge');
    var alertSpot = document.getElementById('success-badges');
    var answerSection = this.element.parentNode.parentNode.querySelector(".success-badges");
    answerSection.insertAdjacentHTML('afterbegin', '<span class="badge badge-success" id="answered_badge">answered</span>');
  }

  revised(){
    var injection = document.getElementById('revised_badge');
    var alertSpot = document.getElementById('success-badges');
    var answerSection = this.element.parentNode.parentNode.querySelector(".success-badges");
    answerSection.insertAdjacentHTML('beforeend', '<span class="badge badge-success" id="revised_badge">revised</span>');
  }

  scrolltop(){
    document.body.scrollTop = document.documentElement.scrollTop = 150;
  }

showFinished(){
  var lastSection = document.getElementById("Supporting the Ecosystem for Innovative Entrepreneurship")
  var finished = document.getElementById("finished");

  if (lastSection.classList.contains("slide--current")) {
      finished.style.display = 'none' ? '' : 'none';
  }
}
  // properButton(){
  //   if slide--current
  // }

  showButton(){
    var lastSection = document.getElementById("last");
    var secondSection = document.getElementById("second");
    var firstSection = document.getElementById("first");
    var thirdSection = document.getElementById("third");
    var next = document.getElementById("nextbutton");
    var back = document.getElementById("backbutton");

    if (lastSection.classList.contains("slide--current")) {
      next.style.display = 'none';
    }
    else if (thirdSection.classList.contains("slide--current")) {
      next.style.display = 'none' ? '' : 'none';
    }
    else if (secondSection.classList.contains("slide--current")) {
      back.style.display = 'none' ? '' : 'none';
    }
    else if (firstSection.classList.contains("slide--current")) {
      back.style.display = 'none';
    }
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
