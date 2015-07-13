class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :option_1
      t.integer :option_1_count
      t.string :option_2
      t.integer :option_2_count
      t.timestamps
    end
  end
end
