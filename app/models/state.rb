class State < ActiveRecord::Base
  attr_accessible :name, :description, :country_id

  validates :name, presence: true

  has_many :sitecities

  has_many :locations

  belongs_to :country

end
