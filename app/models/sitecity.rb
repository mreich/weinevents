class Sitecity < ActiveRecord::Base
  attr_accessible :name, :description, :url, :country_id, :state_id

  validates :name, presence: true

  validates_uniqueness_of :name

  has_many :events

  belongs_to :country 
  belongs_to :state

  #Required for stringex URL conversion
  
  acts_as_url :name

  def to_param
    url
  end

end
