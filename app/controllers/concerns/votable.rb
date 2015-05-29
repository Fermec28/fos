module Votable
  extend ActiveSupport::Concern
  
  def vote
    votable.votes.create(user: current_user)
    redirect_to question_path
  end

  def unvote
    votable.votes.where(user: current_user).take.try(:destroy)
    redirect_to question_path
  end

  def votable
    @votable ||= controller_name.classify.constantize.find(params[:id])
  end

  def question_path
    @votable.respond_to?(:question) ? @votable.question : @votable
  end
end