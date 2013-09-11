class Event < ActiveRecord::Base
  attr_accessible :title, :description, :website, :image, :price, :url, :tag_list, :sitecity_id

  validates :user_id, :title, :description, presence: true
  has_attached_file :image, styles: { medium: "320x240>"}
  validates_attachment :image, 
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }

  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than_or_equal_to => 0, :less_than => 1000}

  belongs_to :user

  belongs_to :sitecity

  
  #Required for stringex URL conversion
  
  acts_as_url :title

  def to_param
    url
  end

  #Required for acts_as_taggable Tagging feature
  acts_as_taggable

end
