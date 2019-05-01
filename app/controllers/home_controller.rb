class HomeController < ApplicationController
  def index
    if @user = current_user
      @posts = Post.includes(:user).all
      render 'posts/index'
    else
      render layout: false 
    end
  end
end
