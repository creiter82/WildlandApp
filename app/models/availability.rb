class Availability < ApplicationRecord
  belongs_to :roster
  belongs_to :user
  belongs_to :availability_position
end
