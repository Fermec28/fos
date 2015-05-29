class Questions::CommentsController < CommentsController
  def create
    question = Question.find(params[:question_id])
    comment = question.comments.create(comment_params)

    redirect_to question
  end
end