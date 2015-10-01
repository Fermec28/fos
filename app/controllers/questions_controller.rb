class QuestionsController < ApplicationController
  include Votable

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @questions = Question.all.order('created_at DESC')
    if params[:q]
      @questions = @questions.where('title like ?', "%#{params[:q]}%")
    end
  end

  def new
    @question = Question.new    
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to questions_path, notice: "La pregunta se ha publicado con éxito"
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  private
    def question_params
      params.require(:question).permit(:title, :description)
    end
end
