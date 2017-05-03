class AddCourseIdToContents < ActiveRecord::Migration[5.0]
  def change
    add_reference :contents, :course, foreign_key: true
  end
end
