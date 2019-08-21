import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "slide" ];

  initialize() {
    this.showSlide(0)
  }

  answered(){
    var answerSection = this.element.parentNode.parentNode;
    answerSection.insertAdjacentHTML('beforeend', '<span class="badge badge-success badges p-2" id="answered_badge">Respondido</span>');
  }

  revised(){
    var answerSection = this.element.parentNode.parentNode;
    answerSection.insertAdjacentHTML('beforeend', '<span class="badge badge-success badges p-2" id="revised_badge">Sugerido</span>');
  }

  scrolltop(){
    document.body.scrollTop = document.documentElement.scrollTop = 150;
  }

showFinished(){
  var lastSection = document.getElementById("title15")
  var firstSection = document.getElementById("title1")
  var secondSection = document.getElementById("title2")
  var continueTo = document.getElementById("continueto")
  var finished = document.getElementById("finished");
  var next = document.getElementById("nextbutton");
  var previous = document.getElementById("prevbutton");

  if (firstSection.classList.contains("slide--current")) {
      previous.style.display = 'none';
      next.style.display = '';
      continueto.style.display = 'none';
      finished.style.display = '';
  }

  // if (intro.classList.contains("slide--current")) {
  //     previous.style.display = 'none';
  //     next.style.display = 'none';
  //     continueto.style.display = 'none' ? '' : 'none';
  //     finished.style.display = 'none';
  // }

  if (secondSection.classList.contains("slide--current")) {
      finished.style.display = 'none';
      continueTo.style.display = 'none';
      previous.style.display = ''
      next.style.display = '';
  }

  if (lastSection.classList.contains("slide--current")) {
      next.style.display = 'none';
      continueTo.style.display = 'none';
      finished.style.display = 'none' ? '' : 'none';
      previous.style.display = ''
  }
}

  showButton(){
    var lastSection = document.getElementById("title15");
    var secondSection = document.getElementById("title2");
    var firstSection = document.getElementById("title1");
    var next = document.getElementById("nextbutton");
    var back = document.getElementById("prevbutton");

    if (lastSection.classList.contains("slide--current")) {
      next.style.display = 'none';
    }
    else if (secondSection.classList.contains("slide--current")) {
      back.style.display = 'none' ? '' : 'none';
    }
    else if (firstSection.classList.contains("slide--current")) {
      back.style.display = 'none';
    }
  }

  close() {
   this.element.parentNode.classList.remove("show");
  }

  next() {
    this.showSlide(this.index + 1);
  }

  previous() {
    this.showSlide(this.index - 1);
  }

  showSlide(index) {
    this.index = index
    this.slideTargets.forEach((el, i) => {
      el.classList.toggle("slide--current", index == i)
    })
  }
}

// if index is the last one, then toggleClassList to close the collapse
