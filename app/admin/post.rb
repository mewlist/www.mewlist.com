ActiveAdmin.register Post do
  controller do
    def show
      @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    end

    def permitted_params
      params.permit post: [:title, :body]
    end
  end

  show do |post|
    render "blog/post", post: post
  end
end
