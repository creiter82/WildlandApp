class Roster < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :availabilities, dependent: :destroy
  has_many :users, through: :availabilities

  validates :name, :start_date, presence: true, uniqueness: true 

  # def set_availability_position position
  #   # availabilities.where(availability_position_id: position.id).order(:created_at)
  #   User.joins(:availabilities).where(availabilities: { availability_position_id: position.id, roster_id: @roster.id }).order(:deployments_count, Availability.arel_table[:created_at])
  # end

end
