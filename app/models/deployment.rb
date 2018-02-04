class Deployment < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :team_deployments, dependent: :destroy
  has_many :users, through: :team_deployments
  has_many :rosters, through: :team_deployments

  mount_uploader :feature_image, ImageUploader
  mount_uploaders :images, ImageUploader

  scope :from_this_year, lambda { where("deployments.created_at > ? AND deployments.created_at < ?", Time.now.beginning_of_year, Time.now.end_of_year) }
end
