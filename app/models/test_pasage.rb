class TestPasage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, optional: true
  
  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def questions_count
    test.questions.count
  end

  def current_question_number
    test.questions.where('id < ?', current_question.id).count + 1
  end

  def result_points
    (correct_questions * 100) / test.questions.size
  end

  def test_passed?
    result_points >= 85
  end

  private

  def before_validation_set_question
    if self.current_question.nil?
      self.current_question = test.questions.first
    else
      self.current_question = next_question
    end
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

end
