class Answers::CommentsController < CommentsController
  def create
    answer = Answer.find(params[:answer_id])
    comment = answer.comments.create(comment_params)

    redirect_to answer.question
  end
end