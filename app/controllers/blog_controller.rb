class BlogController < ApplicationController
  def index
    @posts = Post
      .order('created_at DESC')
      .page(params[:page])
      .per(5)
  end
end
