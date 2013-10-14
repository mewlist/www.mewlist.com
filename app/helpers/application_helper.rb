module ApplicationHelper
  def navbar_link_to name, opts, html_opts = nil
    html_opts ||= {}
    html_opts[:class] ||= ""
    if url_for(opts) == url_for(params)
      html_opts[:class] += " active"
    end
    content_tag :li, link_to( name, opts ), html_opts
  end
end
