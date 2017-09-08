class TeamDeployment < ApplicationRecord
  belongs_to :user, counter_cache: :deployments_count
  belongs_to :deployment
end
