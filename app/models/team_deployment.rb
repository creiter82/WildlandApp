class TeamDeployment < ApplicationRecord
  belongs_to :user
  belongs_to :deployment
end
