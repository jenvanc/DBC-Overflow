$(document).ready(function() {

  $('.new-question').hide()

  $('body').on('click', '.ask-question', function(e) {
    e.preventDefault()
    $('.new-question').slideToggle('slow')
  })

  $(".new-question").submit(function(e) {
    e.preventDefault()
    $.ajax({
      url: $(this).attr('action'),
      type: $(this).attr('method'),
      data: $(this).serialize()
    })
    .done(function(response){
      console.log(response)
      var newQID = response["id"]
      var newTitle = response["title"]
      var newAuthor = response["author"]
      var newQuestion = $("<li class='question-title'><a href='/questions/"+newQID+"'>"+newTitle+"</a> by"+newAuthor)
      $('.question-list').prepend(newQuestion)
      $(e.target)[0].reset()
      $(e.target).slideToggle('slow')
    })
  })

  $(".question-answers").on("submit", ".vote-form", function(e) {
    e.preventDefault();
    $.ajax({
      url: $(this).attr('action'),
      type: $(this).attr('method'),
      data: $(this).serialize()
    })
    .done(function(response){
      $(e.target.parentElement).find('.points').text(response["points"])
      $(e.target).hide()
    })

  })
});
