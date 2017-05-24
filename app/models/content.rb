class Content < ApplicationRecord
  belongs_to :course
  accepts_nested_attributes_for :course

  validates :lesson_number, presence: true
  validates :lesson_description, presence: true
  validates :lesson_teacher, presence: true
end
