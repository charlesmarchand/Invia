class Diploma < ApplicationRecord
  belongs_to :studie
  has_and_belongs_to_many :schools
end
