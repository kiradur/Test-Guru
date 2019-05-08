class AddDescriptionColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :title, :string
  end
end
