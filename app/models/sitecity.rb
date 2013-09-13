class Sitecity < ActiveRecord::Base
  attr_accessible :name, :description, :url

  validates :name, presence: true

  has_many :events

  #Required for stringex URL conversion
  
  acts_as_url :name

  def to_param
    url
  end

end
