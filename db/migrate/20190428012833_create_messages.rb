class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :post_id
      t.integer :user_id
      t.text :content
      t.text :image_url

      t.timestamps
    end
    add_index :messages, :post_id
    add_index :messages, :user_id
  end
end
