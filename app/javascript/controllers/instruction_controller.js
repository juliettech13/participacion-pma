import { Controller } from "stimulus"

export default class extends Controller {
  greet() {
    console.log("Hello, Stimulus!", this.element)
  }

  toggleQuestion() {
    console.log("grabbbbbb it!", this.element)

    var questionBox = document.getElementById("instructions");
    questionBox.style.display = questionBox.style.display === 'none' ? '' : 'none';
  };


  toggleForward(){
    console.log('little engine')
    var activeInstruction = document.getElementById('instructions');
    var firstInstruction = document.getElementById('welcome').innerHTML;
    var secondInstruction = document.getElementById('how-it-works').innerHTML;
    var thirdInstruction = document.getElementById('scale').innerHTML;
    var fourthInstruction = document.getElementById('abstract').innerHTML;
    var next = document.getElementById("nextbutton");
    var back = document.getElementById("backbutton");



      switch (activeInstruction.innerHTML)
      {
        case firstInstruction:
          activeInstruction.innerHTML = secondInstruction;
          back.style.display = 'none' ? '' : 'none';
          break;
        case secondInstruction:
          activeInstruction.innerHTML = thirdInstruction;
          break;
        case thirdInstruction:
          activeInstruction.innerHTML = fourthInstruction;
          document.getElementById("start").style.display = 'none' ? '' : 'none';
          next.style.display = 'none';
          break;
      }

  }

  toggleBack(){
    console.log('little engine')
    var activeInstruction = document.getElementById('instructions');
    var firstInstruction = "The vision intends to create a unifying policy vision for transforming Nigeria's economy and accelerating economic growth. The vision is composed of three sections, and you are invited to feedback on specific policy recommendations and on the entire policy.";
    var secondInstruction = document.getElementById('how-it-works').innerHTML;
    var thirdInstruction = document.getElementById('scale').innerHTML;
    var fourthInstruction = document.getElementById('abstract').innerHTML;
    var back = document.getElementById("backbutton");
    var next = document.getElementById("nextbutton");


     switch (activeInstruction.innerHTML)
      {
        case secondInstruction:
          activeInstruction.innerHTML = firstInstruction;
          back.style.display = 'none';
          break;
        case thirdInstruction:
          activeInstruction.innerHTML = secondInstruction;
          break;
        case fourthInstruction:
          activeInstruction.innerHTML = thirdInstruction;
          document.getElementById("start").style.display = 'none';
          next.style.display = 'none' ? '' : 'none';
          break;
      }
  }
}

