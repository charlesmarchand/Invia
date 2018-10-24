class Studie < ApplicationRecord
  has_and_belongs_to_many :jobs
  has_many :diplomas
end
