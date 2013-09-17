class Sitecity < ActiveRecord::Base
  attr_accessible :name, :description, :url, :country_id

  validates :name, presence: true

  has_many :events

  belongs_to :country

  #Required for stringex URL conversion
  
  acts_as_url :name

  def to_param
    url
  end

end
