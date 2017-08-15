class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :user_certifications
  has_many :certifications, through: :user_certifications 

  has_many :availabilities
  has_many :rosters, through: :availabilities      

  validates_presence_of :name

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end

  def can_signup? roster
    !already_signed_up?(roster)
  end

  def already_signed_up? roster
    return false unless roster
    availabilities.where(roster_id: roster.id).exists?
  end

  def is_engine_boss?
    certifications.where(name: 'engine boss').exists?
  end

end
