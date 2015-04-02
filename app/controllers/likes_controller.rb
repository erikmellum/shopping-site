class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @likes = Like.all
    respond_with(@likes)
  end

  def show
    respond_with(@like)
  end

  def new
    @like = Like.new
    respond_with(@like)
  end

  def edit
  end

  def create
    if(current_user.likes.map{|like| like if(like.user == current_user && like.image == Image.find(params[:image_id]))}.compact.length == 0)
    @like = Like.new(like_params)
    @like.user = current_user
    @like.save
    redirect_to(image_path(params[:image_id]))
    else
      destroy
    end
  end

  def update
    @like.update(like_params)
    respond_with(@like)
  end

  def destroy
    like = current_user.likes.map{|like| like  if(like.user == current_user && like.image == Image.find(params[:image_id])) }.compact[0]
    if(like)
      Like.destroy(like)
      redirect_to(image_path(params[:image_id])) 
    else
      create
    end
  end

  private
    def set_like
      @like = Like.find(params[:id])
    end

    def like_params
      params.permit(:user_id, :comment_id, :image_id)
    end
end
