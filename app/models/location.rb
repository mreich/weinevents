class Location < ActiveRecord::Base
  attr_accessible :city, :description, :email, :name, :phone, :postalcode, :sitecity_id, :street1, :street2, :user_id, :website, :state_id, :country_id, :url, :latitude, :longitude 

	validates :name, :street1, :postalcode, :city, :user_id, :sitecity_id, :state_id, :country_id, presence: true

  validates_uniqueness_of :name

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

  #Assign state and country based on selected sitecity: 

  before_validation :assign_state_and_country

  def assign_state_and_country
    self.state_id = sitecity.state_id
    self.country_id = sitecity.country_id
  end

  def combined_address # required for Geocoder
    address = [street1, city, postalcode, state, country.name].compact.join(', ')
  end

  geocoded_by :combined_address

  after_validation :geocode # auto-fetch coordinates


end
