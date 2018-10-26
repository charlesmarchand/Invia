class Diploma < ApplicationRecord
  #validates :name, :length, :description, :cost, presence: true
  #validates :name, uniqueness: true
  #validates :cost, :length, numericality: true

  has_and_belongs_to_many :schools
  has_and_belongs_to_many :studies
end
