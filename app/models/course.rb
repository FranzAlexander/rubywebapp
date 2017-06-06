class Course < ApplicationRecord
  has_many :contents, :dependent => :destroy

  validates :name, presence: true
  validates :description, presence: true
end
