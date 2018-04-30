module ResumeWebsite
  Markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, no_intra_emphasis: true, fenced_code_blocks: true)
end