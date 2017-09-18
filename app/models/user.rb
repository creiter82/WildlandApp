class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :user_certifications
  has_many :certifications, through: :user_certifications 

  has_many :availabilities
  has_many :rosters, through: :availabilities 
  has_many :availability_positions, through: :availabilities 

  has_many :team_deployments
  has_many :deployments, through: :team_deployments

  before_save :downcase_name  

  validates_presence_of :name

  scope :by_name, -> { all.to_a.sort_by(&:last_name) }

  def phone=(value)
    super(value.blank? ? nil : value.gsub(/[^\w\s]/, '')) 
  end

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
    availabilities.where(roster_id: roster.id).exists?
  end

  def is_engine_boss?
    certifications.where(name: 'engine boss').exists?
  end

  def downcase_name
    self.name.downcase!
  end

end
