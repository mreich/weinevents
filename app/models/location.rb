class Location < ActiveRecord::Base
  attr_accessible :city, :description, :email, :name, :phone, :postalcode, :sitecity_id, :street1, :street2, :user_id, :website, :state_id, :country_id

	#validates :name, :street1, :postalcode, :city, :user_id, :sitecity_id, :state_id, :country_id, presence: true

	has_many :events

	belongs_to :user
  belongs_to :sitecity
  belongs_to :state
  belongs_to :country

	#Required for stringex URL conversion
  
  acts_as_url :name

  def to_param
    url
  end

end
