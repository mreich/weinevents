class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         #:recoverable, 
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body

  has_many :events, :dependent => :destroy 
  has_many :locations
  has_many :sitecities

  has_and_belongs_to_many :roles

  def role?(role)
    return !!self.roles.find_by_name(role)
  end

  after_create :assign_default_role

  def assign_default_role
    self.role_ids = [2] #Default role is :event_organizer
  end

end
