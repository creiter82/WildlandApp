class Roster < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :availabilities
  has_many :users, through: :availabilities

  def set_availability_position position
    availabilities.where(availability_position_id: position.id)
  end

end
