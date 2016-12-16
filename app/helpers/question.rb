helpers do
  def submit_button_value(question)
    question.persisted? ? "Update" : "Create"
  end

  def question_form_action(question)
    question.persisted? ? "/questions/#{question.id}" : "/questions"
  end
end
