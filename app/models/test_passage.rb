class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_one :category, through: :test
  before_validation :before_validation_set_question, only: %i[create update]

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids) && !time_is_over?
    save!
  end

  def questions_count
    test.questions.count
  end

  def current_question_number
    test.questions.where('id < ?', current_question.id).count + 1
  end

  def success?
    percent_correct >= 85
  end

  def percent_correct
    (correct_questions * 100 / questions_count).round(2)
  end

  def time_left
    result = created_at + test.timer.seconds - Time.current
    result >= 0 ? result : 0
  end

  def time_is_over?
    test.timer.nonzero? && time_left <= 0
  end

  private

  def before_validation_set_question
    self.current_question = next_question
  end

  def next_question
    if current_question.nil? || time_is_over?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
     correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

end
