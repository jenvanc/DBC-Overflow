$(document).ready(function() {
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
