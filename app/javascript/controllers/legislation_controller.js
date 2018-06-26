import { Controller } from "stimulus"

export default class extends Controller {
  greet() {
    console.log("Hello, Stimulus!", this.element)
  }

  showSection(e) {
    var consultationBox = document.getElementById('document');
    var selectChoice = e.target.innerHTML;
    var selectSection = document.getElementById(selectChoice);
    var activeSection = document.getElementById('active_section')
    // var section = document.getElementsByClassName()
    activeSection.innerHTML = '';
    activeSection.innerHTML = selectSection.innerHTML
    selectSection.style.display = "block";
    console.log("grab it", selectSection)
  };

  toggleQuestion() {
    console.log("grabbbbbb it!", this.element)

    var questionBox = document.getElementById("questions");
    questionBox.style.display = questionBox.style.display === 'none' ? '' : 'none';
  };

}
