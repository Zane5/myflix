class Video < ActiveRecord::Base
#  has_many :video_categories
#  has_many :categories, through: :video_categories
  belongs_to :category

  validates_presence_of :title, :description
  validates_uniqueness_of :title

  def search_by_title(search_input)
    return [] if search_input == ''
    where("title ILIKE ?", "%#{search_input}%").order("create_at")
  end
end
