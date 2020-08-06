class CreateGoodDeeds < ActiveRecord::Migration
  def change
    create_table :good_deeds do |t|
      t.string :content
      t.integer :user_id
      
      t.timestamps null: false #t.timestamps null :false gives me timestamps everytime we create or update a model. 

    end
  end
end

#attributes: content, user_id
