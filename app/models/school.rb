class School < ApplicationRecord
  #validates :name, :localisation, :description, presence: true
  #validates :name, uniqueness: true
  geocoded_by :localisation
  after_validation :geocode, if: :will_save_change_to_adress?

  has_and_belongs_to_many :diplomas
end
