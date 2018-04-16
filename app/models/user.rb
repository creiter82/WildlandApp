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

  after_create :send_admin_mail

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

  def active_for_authentication? 
    super && approved? 
  end 
  
  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end

  def send_admin_mail
    AdminMailer.new_user_waiting_for_approval(email).deliver
  end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end

end
