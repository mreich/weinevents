class Event < ActiveRecord::Base
  attr_accessible :title, :description, :website, :image, :price

  validates :user_id, :title, :description, presence: true
  has_attached_file :image, styles: { medium: "320x240>"}
  validates_attachment :image, 
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }

  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than => 0, :less_than => 1000}

  belongs_to :user

  
  #Required for stringex URL conversion
  
  #acts_as_url :title

	#def to_param
  #	url
	#end

end
