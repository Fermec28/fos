# base class for Questions::CommentsController and Answers::CommentsController
class CommentsController < ApplicationController
  before_action :authenticate_user!

  private
    def comment_params
      params.require(:comment).permit(:body).merge(user: current_user)
    end
end