class AddAnswerNullConstraint < ActiveRecord::Migration[5.2]
  def up
    change_column_null(:answers, :body_answer, false)
  end

  def down
    change_column_null(:answers, :body_answer, true)
  end
end
