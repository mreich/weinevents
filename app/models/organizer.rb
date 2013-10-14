class Organizer < ActiveRecord::Base
  attr_accessible :name, :description, :email, :phone, :sitecity_id, :user_id, :website, :eventpage, :url

	validates :name, :user_id, :sitecity_id, presence: true

  validates_uniqueness_of :name

	has_many :events


	belongs_to :user
  belongs_to :sitecity
  belongs_to :location
  
	#Required for stringex URL conversion
  
  acts_as_url :name

  def to_param
    url
  end

end
