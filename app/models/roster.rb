class Roster < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :availabilities
  has_many :users, through: :availabilities

  has_many :team_deployments
  has_many :deployments, through: :team_deployments

  def set_availability_position position
    availabilities.where(availability_position_id: position.id).order(:created_at)
  end

end
