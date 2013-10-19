class BlogController < ApplicationController
  def index
    @posts = Post
      .order('created_at DESC')
      .where(published: true)
      .page(params[:page])
      .per(5)
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
  end
end
