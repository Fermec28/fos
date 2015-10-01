class Answers::CommentsController < CommentsController
  def create
    answer = Answer.find(params[:answer_id])
    @answer_comment = answer.comments.new(comment_params)
    @answer_comment.user = current_user
    if @answer_comment.save
      redirect_to answer.question
    else
      @question = answer.question
      render 'questions/show'
    end
  end
end