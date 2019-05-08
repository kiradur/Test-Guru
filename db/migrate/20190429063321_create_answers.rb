class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :body
      t.integer :test_id
      t.boolean :correct

      t.timestamps
    end
  end
end
