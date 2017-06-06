class Course < ApplicationRecord
  has_many :contents, :dependent => :destroy #A one to many relation ship with contents.

  validates :name, presence: true
  validates :description, presence: true
end
