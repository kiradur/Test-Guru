document.addEventListener('turbolinks:load', function() {
  var control = document.getElementById('current-test')

  if (control) {
    var questionId = document.getElementById('current-test').dataset.currentQuestion
    var questionsCount = document.getElementById('current-test').dataset.questionsCount

    formProgressBar(questionId, questionsCount)
  }
})

function formProgressBar(questionId, questionsCount) {
  var elem = document.getElementById('myBar')

  elem.style.width = (questionId * 100) / questionsCount + "%"
}
