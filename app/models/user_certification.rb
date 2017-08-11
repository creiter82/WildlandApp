class UserCertification < ApplicationRecord
  belongs_to :user
  belongs_to :certification
end
