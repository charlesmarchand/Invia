class School < ApplicationRecord
  #validates :name, :localisation, :description, presence: true
  #validates :name, uniqueness: true

  has_and_belongs_to_many :diplomas
end
