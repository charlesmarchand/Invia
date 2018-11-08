class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :name, :email, :password, presence: true
  # validates :email, uniqueness: true

  has_many :profile_saved_infos
  has_many :schools, through: :profile_saved_infos
  has_many :studies, through: :profile_saved_infos
  has_many :jobs, through: :profile_saved_infos
  has_many :diplomas, through: :profile_saved_infos
end

