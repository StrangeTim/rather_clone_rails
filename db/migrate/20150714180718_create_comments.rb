class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :question_id
      t.string :text
      t.string :email
      t.timestamps
    end
  end
end
