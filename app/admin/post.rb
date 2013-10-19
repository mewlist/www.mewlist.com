ActiveAdmin.register Post do
  controller do
    def permitted_params
      params.permit post: [:title, :body]
    end
  end
end
