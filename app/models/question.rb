class Question < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :comments
  # validates stuff

  def votedOn(user_id, question)
    vote = Vote.find_by(user_id: user_id, question_id: question.id)
    if vote == nil
      return false
    else
      if vote.option == 1
        return question.option_1
      elsif vote.option == 2
        return question.option_2
      else
        return "There was an error processing your vote"
      end
    end
  end

end
