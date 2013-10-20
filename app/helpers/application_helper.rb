module ApplicationHelper
  def navbar_link_to name, opts, html_opts = nil
    html_opts ||= {}
    html_opts[:class] ||= ""
    match = opts.delete :match
    if match
      if match.match url_for(params).gsub(/\?.+$/, '')
        html_opts[:class] += " active"
      end
    else
      if url_for(opts) == url_for(params).gsub(/\?.+$/, '')
        html_opts[:class] += " active"
      end
    end
    content_tag :li, link_to( name, opts ), html_opts
  end
end
