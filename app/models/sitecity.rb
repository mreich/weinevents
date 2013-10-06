class Sitecity < ActiveRecord::Base
  attr_accessible :name, :description, :url, :country_id, :state_id

  validates :name, presence: true

  validates_uniqueness_of :name

  has_many :events
  has_many :locations
  has_many :events, :through => :locations

  belongs_to :country 
  belongs_to :state
  belongs_to :user

  #Required for stringex URL conversion
  
  acts_as_url :name

  def to_param
    url
  end

  default_scope order('name ASC')

  scope :germany, lambda { where('country_id = 1') }
  scope :austria, lambda { where('country_id = 2') }
  scope :switzerland, lambda { where('country_id = 3') }
  
  #Sitecities with at least one event
  scope :has_event, ->(n = 1) { includes(:events).select { |w| w.events.size >= n } }

  def combined_address # required for Geocoder
    address = [name, state.name, country.name].compact.join(', ')
  end

  geocoded_by :combined_address

  after_validation :geocode # auto-fetch coordinates
end
