class Professional < ApplicationRecord
  # validates :name, :job, :school, :linkedin_link, presence: true
  # validates :linkedin_link, uniqueness: true

  belongs_to :job
end
