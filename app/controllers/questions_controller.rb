class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @vote = Vote.new
  end

  def new
    @question = Question.new
  end

  def create
    @vote = Vote.new
    user = current_user
    @question = user.questions.new(question_params)
    # if vote count fails or errors, instead get vote count from votes table
    @question.option_1_count = 0
    @question.option_2_count = 0
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
    if @question.user_id == current_user.try(:id)
      @question.delete
      respond_to do |format|
        format.html {redirect_to '/'}
        format.js
      end
    else
      flash[:alert] = "You do not have the appropriate permissions to control that action"
      redirect_to '/'
    end
  end


  private

  def question_params
    params.require(:question).permit(:option_1, :option_2)
  end

end
