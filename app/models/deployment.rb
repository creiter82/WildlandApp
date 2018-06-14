class Deployment < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :team_deployments, dependent: :destroy
  has_many :users, through: :team_deployments
  has_many :rosters, through: :team_deployments

  mount_uploader :feature_image, ImageUploader
  mount_uploaders :images, ImageUploader

  scope :from_this_year, lambda { where("deployments.created_at > ? AND deployments.created_at < ?", Time.current.beginning_of_year, Time.current.end_of_year) }

  private
    def should_generate_new_friendly_id?
      name_changed?
    end

    def slug=(value)
      if value.present?
        write_attribute(:slug, value)
      end
    end

end
