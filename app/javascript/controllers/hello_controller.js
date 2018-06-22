// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  greet() {
    console.log("Hello, Stimulus!", this.element)
  }

  toggleQuestion() {
    console.log("grabbbbbb it!", this.element)

    document.getElementById("notice").style.display = "none";
  };

}

// export default class extends Controller {
//   static targets = [ "output" ]

//   connect() {
//     this.outputTarget.textContent = 'Hello, Stimulus!'
//   }
// }
