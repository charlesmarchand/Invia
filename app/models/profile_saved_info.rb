class ProfileSavedInfo < ApplicationRecord
  belongs_to :user
  belongs_to :job
  belongs_to :study
  belongs_to :diploma
  belongs_to :school
end
