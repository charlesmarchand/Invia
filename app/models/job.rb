class Job < ApplicationRecord
  # validates :name, :description, presence: true
  # validates :name, uniqueness: true

  belongs_to :category

  has_many :professionals

  has_and_belongs_to_many :keywords
  has_and_belongs_to_many :studies

end
