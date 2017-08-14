class Roster < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :availabilities
  has_many :users, through: :availabilities

end
