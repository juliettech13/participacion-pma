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
    var firstInstruction = "The vision intends to create a unifying policy vision for transforming Nigeria's economy and accelerating economic growth. The vision is composed of four chapters, and you are invited to comment on specific policy recommendations, on chapters, on the introduction and on the entire policy.";
    var secondInstruction = "Navigate through the policy and <strong>click on clauses</strong> to interact with them. You will be presented with questions using a 1 through 5 scale, 1 means <strong>you strongly oppose</strong> and 5 means <strong>you are strongly in favor</strong>.";
    var thirdInstruction = "After answering the first two questions, you will have the opportunity to <strong>suggest a revision</strong> should you feel compelled. There is no maximum or minimum participation, go at your own pace.";
    var fourthInstruction = "If you like something, please let us know. If you think we can improve anything to support innovation, entrepreneurship or ICT developmemt, please let us know how. Thanks for your participation!";
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
    var firstInstruction = "The vision intends to create a unifying policy vision for transforming Nigeria's economy and accelerating economic growth. The vision is composed of four chapters, and you are invited to comment on specific policy recommendations, on chapters, on the introduction and on the entire policy.";
    var secondInstruction = "Navigate through the policy and <strong>click on clauses</strong> to interact with them. You will be presented with questions using a 1 through 5 scale, 1 means <strong>you strongly oppose</strong> and 5 means <strong>you are strongly in favor</strong>.";
    var thirdInstruction = "After answering the first two questions, you will have the opportunity to <strong>suggest a revision</strong> should you feel compelled. There is no maximum or minimum participation, go at your own pace.";
    var fourthInstruction = "If you like something, please let us know. If you think we can improve anything to support innovation, entrepreneurship or ICT developmemt, please let us know how. Thanks for your participation!";
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

