class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :teacher_id
      t.integer :student_id
      t.text :content
      t.text :image_url

      t.timestamps
    end
    add_index :messages, :teacher_id
    add_index :messages, :student_id
    add_index :messages, [:teacher_id, :student_id], unique: true
  end
end
