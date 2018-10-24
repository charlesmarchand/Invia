class Job < ApplicationRecord
  validates :name :description, presence: true
  validates :name, uniqueness: true
  has_and_belongs_to_many :keywords, :studies
  has_many :profesionnals
end
