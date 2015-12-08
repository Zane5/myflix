class Video < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, -> { order "created_at DESC" }
  validates_presence_of :title, :description

  before_create :generate_token

  def self.search_by_title(search_term)
    return [] if search_term == ''
    where("title ILIKE ?", "%#{search_term}%").order("created_at DESC")
  end

  def to_param
    token
  end

  private

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end
