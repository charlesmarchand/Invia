class Professional < ApplicationRecord
  validates :name, :job, :school, :linkedin_link, presence: true
  belongs_to :job
end
