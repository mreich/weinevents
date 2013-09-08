class Event < ActiveRecord::Base
  attr_accessible :title, :description, :website, :image

  validates :user_id, :title, :description, presence: true
  has_attached_file :image, styles: { medium: "320x240>"}
  validates_attachment :image, 
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }

  belongs_to :user

end
