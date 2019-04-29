class AddTestsTitleNullContraint < ActiveRecord::Migration[5.2]
  def up
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
    change_column_null(:tests, :categories_id, false)
  end

  def down
    change_column_null(:tests, :title, true)
    change_column_null(:tests, :level, true)
    change_column_null(:tests, :categories_id, true)
  end

end

