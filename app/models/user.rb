class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin], multiple: false)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :confirmable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_qualifications
  has_many :qualifications, through: :user_qualifications 

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

  # def name
  #   super.titleize
  # end

  def can_signup? roster
    !already_signed_up?(roster)
  end

  def already_signed_up? roster
    availabilities.where(roster_id: roster.id).exists?
  end

  def is_engine_boss?
    qualifications.where(name: 'engine boss').exists?
  end

  def is_on_deployment? deployment
    team_deployments.where(deployment_id: deployment.id).exists?
  end

  def downcase_name
    self.name.downcase!
  end

end
