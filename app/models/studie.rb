class Studie < ApplicationRecord
  validates :name, :description, :difficulty, presence: true
  validates :name, uniqueness: true
  validates :difficulty, inclusion: { in: [0, 1, 2, 3, 4, 5]},
            message: "Entre 0 et 5 s'il vous plaît" }

  has_many :diplomas
  has_and_belongs_to_many :jobs, :profiles
end
