class Question < ActiveRecord::Base

  validates_presence_of :question
  validates_presence_of :answer

  def is_correct?(submission)
    self.answer = answer.to_i.to_s == answer ? Integer(answer).humanize : answer
    submission = submission.to_i.to_s == submission ? Integer(submission).humanize : submission
    answer.squish.downcase == submission.squish.downcase
  end

end
