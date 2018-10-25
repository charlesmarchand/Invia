class Diploma < ApplicationRecord
  validates :name, :length, :description, :cost, presence: true
  validates :name, uniqueness: true
  validates :cost, :length, numericality: true

  belongs_to :studie
  has_and_belongs_to_many :schools
end
