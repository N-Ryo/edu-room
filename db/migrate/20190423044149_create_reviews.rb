class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content 
      t.string :reviewer
      t.string :reviewing

      t.timestamps
    end
  end
end
