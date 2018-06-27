import { Controller } from "stimulus"

export default class extends Controller {
  greet() {
    console.log("Hello, Stimulus!", this.element)
  }

  showSection(e) {
    console.log("grab it", document.getElementById(e.target.innerHTML))
    // var selectSection = document.getElementById(e.target.innerHTML);
    // var consultationBox = ""
    var consultationBox = document.getElementById('active_section');

    consultationBox.innerHTML = document.getElementById(e.target.innerHTML).innerHTML;
    console.log("grab it", consultationBox)
  };

  toggleQuestion() {
    console.log("grabbbbbb it!", this.element)

    var questionBox = document.getElementById("questions");
    questionBox.style.display = questionBox.style.display === 'none' ? '' : 'none';
  };

}
