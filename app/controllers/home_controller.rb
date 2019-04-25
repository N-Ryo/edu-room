class HomeController < ApplicationController
  def index
    @posts = Post.includes(:users).all
    render layout: false 
  end
end
