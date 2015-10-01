class Questions::CommentsController < CommentsController
  def create
    @question = Question.find(params[:question_id])
    @question_comment = @question.comments.new(comment_params)
    @question_comment.user = current_user
    if @question_comment.save
      redirect_to @question
    else
      render 'questions/show'
    end
  end
end