class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
        t.string :lesson_num
        t.text :lesson_con
      t.timestamps
    end
  end
end
