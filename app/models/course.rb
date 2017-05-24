class Course < ApplicationRecord
  has_many :contents

  validates :name, presence: true
  validates :description, presence: true
end
