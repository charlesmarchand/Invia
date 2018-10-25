class Profile < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

  has_and_belongs_to_many :schools, :studies, :jobs, :diplomas
end
