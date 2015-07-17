class Video < ActiveRecorder::Base

  has_many :categories, throuth: :video_categories

  validates_presence_of :title, :description
  #validates_uniqueness_of :title
end
