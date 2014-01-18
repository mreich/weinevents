class Event < ActiveRecord::Base
  attr_accessible :title, :description, :website, :image, :price, :url, :tag_list, :sitecity_id, :enddatetime, :startdatetime, :location, :street1, :street2, :city, :postalcode, :email, :phone, :location_id, :external_location_id

  validates :user_id, :title, :description, presence: true
  has_attached_file :image, styles: { medium: "320x240>"}
  validates_attachment :image, 
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }

  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than_or_equal_to => 0, :less_than => 10000}

  belongs_to :user
  belongs_to :sitecity
  belongs_to :location
  belongs_to :external_location, :class_name => "Location"
  
  #Required for stringex URL conversion
  
  acts_as_url :title

  def to_param
    url
  end

  #Required for acts_as_taggable Tagging feature
  acts_as_taggable

  scope :current, lambda { where('startdatetime >= ?', Time.now) }

  scope :past, lambda { where('startdatetime < ?', Time.now) }

  #Assign sitecity based on selected location: 

  before_validation :assign_sitecity

  def assign_sitecity
    self.sitecity_id = location.sitecity_id
  end
  
  # Send tweet to Twitter
  def send_tweet(tweet)
    client = Twitter::Client.new
    client.update(tweet)   
  end

  # Before creating an event, shorten the URL with bitly and then tweet the Event (only on production)
  after_create :tweet_event

  def tweet_event
    return '' if not Rails.env.production?
    bitly = Bitly.client
    u = bitly.shorten("http://www.weinevents.de/events/#{url}")
    u = u.short_url
    tweet = "Neues #Wein Event in ##{sitecity.name}: " + title + " " + u
    send_tweet(tweet)
  end

end
