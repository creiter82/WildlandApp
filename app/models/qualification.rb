class Qualification < ApplicationRecord
  has_many :user_qualifications
  has_many :users, through: :user_qualifications

  def name
    super.titleize
  end
end
