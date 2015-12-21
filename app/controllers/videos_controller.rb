class  VideosController < ApplicationController
  before_filter :require_user
  
  def index
    @videos = Video.all
    @categories = Category.all
  end

  def show
    @video = Video.find(params[:id])
    @reviews = @video.reviews
  end

  def search
    @results = Video.search_by_title(params[:search_term])
  end

  def create
    @video = Video.new(video_params)
    @video.save
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :small_cover, :large_cover, :categroy, :video_url)
  end

end
