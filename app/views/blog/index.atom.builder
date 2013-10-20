atom_feed do |feed|
  feed.title("Posts Index")
  feed.updated((@posts.first.created_at))

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(@markdown.render( post.body ).html_safe, type: 'html')

      #entry.author do |author|
      #  author.name(post.author_name)
      #end
    end
  end
end
