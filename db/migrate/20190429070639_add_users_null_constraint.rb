class AddUsersNullConstraint < ActiveRecord::Migration[5.2]
  def up
    hange_column_null(:users, :name, false)
  end

  def down
    hange_column_null(:users, :name, true)
  end
end
