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

end
