class VotesController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @vote = @question.votes.new(vote_params)

    if current_user.try(:id).is_a? Integer
      @vote.user_id = current_user.id
    else
      flash[:alert] = "Please login to vote."
      redirect_to '/'
    end

    if @question.option_1 === params[:commit]
      @vote.option = 1
      option_1_count = @question.option_1_count + 1
      @question.update(option_1_count: option_1_count)
    else
      @vote.option = 2
      option_2_count = @question.option_2_count + 1
      @question.update(option_2_count: option_2_count)
    end
    @vote.save
    respond_to do |format|
      format.html {redirect_to '/'}
      format.js
    end
  end
  #
  # def update
  # end

private
  def vote_params
    params.require(:vote).permit(:option)
  end
end
