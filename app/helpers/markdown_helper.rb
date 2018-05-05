module MarkdownHelper
  def markdown(text)
    ResumeWebsite::Markdown.render(text).html_safe
  end
end