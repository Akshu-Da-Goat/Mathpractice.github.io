<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Adaptive Math Test</title>
<style>
  body { font-family: Arial, sans-serif; margin: 50px; }
  .question { font-size: 1.2em; margin-bottom: 20px; }
  input { padding: 5px; font-size: 1em; }
  button { padding: 5px 10px; font-size: 1em; }
  .feedback { margin-top: 15px; font-weight: bold; }
</style>
</head>
<body>

<h1>Adaptive Math Test Simulator</h1>
<div class="question" id="question">Loading...</div>
<input type="text" id="answer" placeholder="Type your answer" />
<button onclick="checkAnswer()">Submit</button>
<div class="feedback" id="feedback"></div>

<script>
let difficulty = 1; // starting difficulty
let currentQuestion = {};
let score = 0;

// Generate a random question based on difficulty
function generateQuestion() {
    let a = Math.floor(Math.random() * (difficulty * 10)) + 1;
    let b = Math.floor(Math.random() * (difficulty * 10)) + 1;
    let type = Math.floor(Math.random() * 3); // 0:add, 1:sub, 2:mul
    let questionText = "";
    let answer = 0;
    
    if(type === 0) { // addition
        questionText = `${a} + ${b} = ?`;
        answer = a + b;
    } else if(type === 1) { // subtraction
        questionText = `${a + b} - ${a} = ?`;
        answer = b;
    } else { // multiplication
        questionText = `${a} × ${b} = ?`;
        answer = a * b;
    }

    currentQuestion = {questionText, answer};
    document.getElementById("question").textContent = questionText;
    document.getElementById("answer").value = "";
    document.getElementById("feedback").textContent = "";
}

// Check answer and adjust difficulty
function checkAnswer() {
    const userAnswer = parseInt(document.getElementById("answer").value);
    if(userAnswer === currentQuestion.answer) {
        document.getElementById("feedback").textContent = "Correct! ✅";
        difficulty += 1; // increase difficulty
        score += 1;
    } else {
        document.getElementById("feedback").textContent = `Wrong! ❌ Answer: ${currentQuestion.answer}`;
        if(difficulty > 1) difficulty -= 1; // decrease difficulty
    }
    // small delay then next question
    setTimeout(generateQuestion, 1000);
}

// start the first question
generateQuestion();
</script>

</body>
</html>
