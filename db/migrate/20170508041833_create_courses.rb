class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
         t.string :name
         t.text :description
         t.date :date_started
         t.date :date_ended

         t.timestamps
    end
  end
end
