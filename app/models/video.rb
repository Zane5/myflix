class Video < ActiveRecord::Base
  belongs_to :category

  validates_presence_of :title, :description
  validates_uniqueness_of :title

  def self.search_by_title(search_term)
    return [] if search_term == ''
    where("title ILIKE ?", "%#{search_term}%").order("create_at DESC")
  end
end
