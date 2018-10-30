class School < ApplicationRecord
  #validates :name, :address, :description, presence: true
  #validates :name, uniqueness: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_and_belongs_to_many :diplomas
end
