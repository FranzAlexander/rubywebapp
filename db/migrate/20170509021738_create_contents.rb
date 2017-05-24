class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.integer :lesson_number
      t.string :lesson_description
      t.string :class_room
      t.string :lesson_teacher
      t.references :course, index: true, foreign_key:true

      t.timestamps
    end
  end
end
