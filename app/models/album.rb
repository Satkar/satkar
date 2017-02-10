class Album < ActiveRecord::Base
  belongs_to :publisher
  has_many :songs
  
  validates :name, presence: true, length: { in: 2..50 }
  validates :cover_art, presence: true
  validates :released_on, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "should be in the format YYYY-MM-DD" }
  validates :publisher_id, presence: true
  scope :latest, -> { order("released_on").last }
  
  # returns only the last n albums released during the past 6 months.
  scope :recent, ->(n) { where("released_on > ?", 6.month.ago).order("released_on desc").limit(n) }

  after_save :detele_cache_key

  def self.latest_two_albums
    Rails.cache.fetch("latest_two_albums") do
      order("released_on desc").limit(2)
    end
  end

  def detele_cache_key
  	Rails.cache.delete("latest_two_albums")
  end

end
