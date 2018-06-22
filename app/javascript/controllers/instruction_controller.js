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
    var firstInstruction = "The vision intends to create a unifying policy vision for transforming [COUNTRY] economy and accelerating economic growth. The vision is composed of four chapters, and you are invited to comment on specific policy recommendations, on chapters, on the introduction and on the entire policy.";
    var middleInstruction = "Leave and come back anytime, your progress is saved.";
    var lastInstruction = "Click on any of the sections or clauses. If you like something, please let us know. If you think we can improve anything to support innovation, entrepreneurship or ICT developmemt, please let us know how. Thanks for your participation!";
    var next = document.getElementById("nextbutton");

      switch (activeInstruction.innerHTML)
      {
        case firstInstruction:
          activeInstruction.innerHTML = middleInstruction;
          break;
        case middleInstruction:
          activeInstruction.innerHTML = lastInstruction;
          break;
        case lastInstruction:
          next.style.display = 'none';
          break;
        default:
          alert('Default case');
      }

  }

  toggleBack(){
    console.log('little engine')
    var activeInstruction = document.getElementById('instructions');
    var firstInstruction = "The vision intends to create a unifying policy vision for transforming [COUNTRY] economy and accelerating economic growth. The vision is composed of four chapters, and you are invited to comment on specific policy recommendations, on chapters, on the introduction and on the entire policy.";
    var middleInstruction = "Leave and come back anytime, your progress is saved.";
    var lastInstruction = "Click on any of the sections or clauses. If you like something, please let us know. If you think we can improve anything to support innovation, entrepreneurship or ICT developmemt, please let us know how. Thanks for your participation!";
    var back = document.getElementById("backbutton");

     switch (activeInstruction.innerHTML)
      {
        case firstInstruction:
          back.style.display = 'none';
          break;
        case middleInstruction:
          activeInstruction.innerHTML = firstInstruction;
          break;
        case lastInstruction:
          activeInstruction.innerHTML = middleInstruction;
          break;
        default:
          alert('Default case');
      }
  }
}

