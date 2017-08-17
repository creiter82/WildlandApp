class Deployment < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :team_deployments
  has_many :users, through: :team_deployments
  has_many :rosters, through: :team_deployments
end
