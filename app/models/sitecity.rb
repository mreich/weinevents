class Sitecity < ActiveRecord::Base
  attr_accessible :name, :description

  validates :name, presence: true

  has_many :events
end
