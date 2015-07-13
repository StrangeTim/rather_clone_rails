class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    user = current_user
    @question = user.questions.new(question_params)
    @question.save
    respond_to do |format|
      format.html {redirect_to '/'}
      format.js
    end
  end

  def show
    @question = Question.find(params[:id])
  end
  #
  # def edit
  #
  # end
  #
  # def update
  #
  # end
  #
  def destroy
    @question = Question.find(params[:id])
    @question.delete
    respond_to do |format|
      format.html {redirect_to '/'}
      format.js
    end
  end

  private

  def question_params
    params.require(:question).permit(:option_1, :option_2)
  end

end
