class CommentsController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @comment = Comment.new
  end

  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new(comment_params)

    if current_user.try(:id).is_a? Integer
      @comment.user_id = current_user.id
      @comment.email = current_user.email
    else
      flash[:alert] = "Please login to comment."
      redirect_to '/'
    end

    @comment.save
    respond_to do |format|
      format.html {redirect_to '/'}
      format.js
    end
  end

  def destroy
    
    @comment = Comment.find(params[:id])
    @comment.delete
    respond_to do |format|
      format.html {redirect_to '/'}
      format.js
    end
  end

private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
