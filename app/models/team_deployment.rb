class TeamDeployment < ApplicationRecord
  belongs_to :user
  belongs_to :roster
  belongs_to :deployment
end
