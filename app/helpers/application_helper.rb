module ApplicationHelper
  require 'open-uri'
  
  def markdown(text)
    ResumeWebsite::Markdown.render(text).html_safe
  end
  
  def read_file_from_url(url)
    open(url).read
  end
end
