class AnswersController < ApplicationController
  include Votable

  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user
    if @answer.save
      redirect_to @question, notice: "Tu respuesta ha sido creada con éxito"
    else
      render 'questions/show'
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:description)
    end
end