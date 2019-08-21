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
  console.log(this.element.childNodes);
  console.log(this);
  var lastSection = document.getElementById("title15")
  // var lastSection = document.getElementById("Supporting the Ecosystem for Innovative Entrepreneurship")
  var firstSection = document.getElementById("title1")
  // var firstSection = document.getElementById("Digital Infrastructure")
  var secondSection = document.getElementById("title2")
  console.log(firstSection, 'first')
  console.log(secondSection, 'second')
  var continueTo = document.getElementById("continueto")
  // var intro = document.getElementById("Introduction")
  var finished = document.getElementById("finished");
  var next = document.getElementById("nextbutton");
  console.log(next, 'next')
  var previous = document.getElementById("prevbutton");
  console.log(previous, 'previous')

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
    console.log(firstSection, 'first');
    console.log(secondSection, 'second')
    // var thirdSection = document.getElementById("title3");
    var next = document.getElementById("nextbutton");
    console.log(next, 'next button')
    var back = document.getElementById("prevbutton");
    console.log(back, 'back button')


    if (lastSection.classList.contains("slide--current")) {
      next.style.display = 'none';
    }
    // else if (thirdSection.classList.contains("slide--current")) {
    //   next.style.display = 'none' ? '' : 'none';
    // }
    else if (secondSection.classList.contains("slide--current")) {
      back.style.display = 'none' ? '' : 'none';
    }
    else if (firstSection.classList.contains("slide--current")) {
      back.style.display = 'none';
    }
  }

  close() {
   this.element.parentNode.classList.remove("show");
   console.log("hello from close")
  }

  next() {
    this.showSlide(this.index + 1);
    console.log("hello from next")
  }

  previous() {
    this.showSlide(this.index - 1);
    console.log("hello from previous")
  }

  showSlide(index) {
    this.index = index
    this.slideTargets.forEach((el, i) => {
      el.classList.toggle("slide--current", index == i)
    })
  }
}

// if index is the last one, then toggleClassList to close the collapse
