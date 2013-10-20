class BlogController < ApplicationController
  before_filter :setup

  def index
    @posts = Post
      .order('created_at DESC')
      .where(published: true)
      .page(params[:page])
      .per(5)
  end

  def show
    @post = Post
      .where(published: true)
      .find(params[:id])
  end

  private
  def setup
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
  end
end
