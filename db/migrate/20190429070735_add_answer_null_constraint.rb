class AddAnswerNullConstraint < ActiveRecord::Migration[5.2]
  def up
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :test_id, false)
  end

  def down
    change_column_null(:answers, :body, true)
    change_column_null(:answers, :test_id, true)
  end

end
