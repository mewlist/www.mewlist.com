ActiveAdmin.register Post do
  controller do
    def show
      @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    end

    def permitted_params
      params.permit post: [:title, :body, :published]
    end
  end

  show do |post|
    render "blog/post", post: post, title_link: false
  end
end
