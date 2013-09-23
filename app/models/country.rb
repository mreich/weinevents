class Country < ActiveRecord::Base
  attr_accessible :name, :description

  validates :name, presence: true

  has_many :sitecities

	has_many :locations

  #Required for stringex URL conversion
  
  #acts_as_url :name

  #def to_param
   # url
  #end

end
