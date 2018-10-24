class Profile < ApplicationRecord
  has_many :schools, :studies, :jobs, :diplomas
  validates :name, :email, :password, presence: true
end
