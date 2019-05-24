class Answer < ApplicationRecord
  belongs_to :question

  validates :body_answer, presence: true
  validate :validate_count_answers

  scope :correct, -> { where(correct: true) }

  private

  def validate_count_answers
    errors.add(:body_answer) unless Answer.where(question_id: self.question_id).count < 4
  end
end
