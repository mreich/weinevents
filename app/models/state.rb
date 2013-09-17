class State < ActiveRecord::Base
  attr_accessible :name, :description, :country_id

  validates :name, presence: true

  has_many :sitecities

  belongs_to :country

end
