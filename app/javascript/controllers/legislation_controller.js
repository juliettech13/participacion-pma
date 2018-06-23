import { Controller } from "stimulus"

export default class extends Controller {
  greet() {
    console.log("Hello, Stimulus!", this.element)
  }

  toggleQuestion() {
    console.log("grabbbbbb it!", this.element)

    var questionBox = document.getElementById("questions");
    questionBox.style.display = questionBox.style.display === 'none' ? '' : 'none';
  };

}
