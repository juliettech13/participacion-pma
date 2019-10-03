import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "slide", 'welcome' ];

  initialize() {
    this.showSlide(0)
  }

  connect(){
    var chapter = document.getElementById('chapter0');
    if (chapter) {
      chapter.style.display = 'none'
    }
  }

  answered(){
    var answerSection = this.element.parentNode.parentNode;
    answerSection.insertAdjacentHTML('beforeend', '<span class="badge badge-success badges p-2 font-small" id="answered_badge">Resultado Recibido</span>');
  }

  revised(){
    var answerSection = this.element.parentNode.parentNode;
    answerSection.insertAdjacentHTML('beforeend', '<span class="badge badge-success badges p-2 font-small" id="revised_badge">Sugerencia Recibida</span>');
  }

  scrolltop(){
    document.body.scrollTop = document.documentElement.scrollTop = 150;
    console.log("hello from scrolltop")
  }

  activateSelection(){
    var titles = document.querySelectorAll('.title');
    titles.forEach((title) => {
      if (title.classList.contains("slide--current")){
        title.classList.remove('slide--current')
      }
    })
    var titleNum = event.target.dataset.info
    var titleToActivate = document.querySelector(`#title${titleNum}`);
    titleToActivate.classList.add('slide--current');
  }

  showFinished(){
    var lastSection = document.getElementById("title15")
    var firstSection = document.getElementById("title1")
    var secondSection = document.getElementById("title2")
    var continueTo = document.getElementById("continueto")
    // var finished = document.getElementById("finished");
    var next = document.getElementById("nextbutton");
    var previous = document.getElementById("prevbutton");

    if (firstSection.classList.contains("slide--current")) {
      previous.style.display = 'none';
      next.style.display = '';
      continueto.style.display = 'none';
      // finished.style.display = '';
    }

    if (secondSection.classList.contains("slide--current")) {
      // finished.style.display = 'none';
      continueTo.style.display = 'none';
      previous.style.display = ''
      next.style.display = '';
    }

    if (lastSection.classList.contains("slide--current")) {
      next.style.display = 'none';
      continueTo.style.display = 'none';
      // finished.style.display = 'none' ? '' : 'none';
      previous.style.display = ''
    }
  }

  showButton(){
    var lastSection = document.getElementById("last");
    var secondSection = document.getElementById("second");
    var firstSection = document.getElementById("first");
    var next = document.getElementById("nextbutton");
    var back = document.getElementById("backbutton");

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
    this.index = index;
    this.slideTargets.forEach((el, i) => {
      el.classList.toggle("slide--current", index == i)
    })
  }


}

// if index is the last one, then toggleClassList to close the collapse
