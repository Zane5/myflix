class  VideosController < ApplicationController
  #before_action :require_user
  
  def index
    @videos = Video.all
    @categories = Category.all
  end

  def show
    @video = Video.find(params[:id])
  end

end
