class AddQuestionNullConstraint < ActiveRecord::Migration[5.2]
  def up
    change_column_null(:questions, :body, false)
    change_column_null(:questions, :test_id, false)
  end

  def down
    change_column_null(:questions, :body, true)
    change_column_null(:questions, :test_id, true)
  end
end
