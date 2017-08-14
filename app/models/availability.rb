class Availability < ApplicationRecord
  belongs_to :roster
  belongs_to :user
end
