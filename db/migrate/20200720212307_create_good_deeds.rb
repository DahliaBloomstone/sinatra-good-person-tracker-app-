class CreateGoodDeeds < ActiveRecord::Migration
  def change
    create_table :good_deeds do |t|
      t.string :content
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
