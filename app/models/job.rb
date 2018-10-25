class Job < ApplicationRecord
  validates :name, :description, :category, presence: true
  validates :name, uniqueness: true

  belongs_to :category

  has_many :profesionnals

  has_and_belongs_to_many :keywords, :studies, :profiles
end
