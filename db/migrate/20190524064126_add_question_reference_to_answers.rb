class AddQuestionReferenceToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers, :question, foreign_key: true
    change_column :answers, :question_id, :integer, null: false
  end
end
