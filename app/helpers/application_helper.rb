module ApplicationHelper
  #def markdown(text)
  #  options = {
  #    filter_html:     true,
  #    hard_wrap:       true,
  #    link_attributes: { rel: 'nofollow', target: "_blank" },
  #    space_after_headers: true,
  #  }

  #  extensions = {
  #    autolink:           true,
  #    superscript:        true,
  #    fenced_code_blocks: true,
  #    disable_indented_code_blocks: true
  #  }
  #  if text.blank?
  #    nil
  #  else
  #    renderer = Redcarpet::Render::HTML.new(options)
  #    markdown = Redcarpet::Markdown.new(renderer, extensions)

  #    markdown.render(text).html_safe
  #  end
  #end

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer:language)
    end
  end

  def markdown(text)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true,link_attributes: { rel: 'nofollow', target: "_blank" },space_after_headers: true)
    options = {
      autolink: true,
      superscript: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true,
      no_intra_emphasis: true,
      lax_html_blocks: true,
      strikethrough: true,
      lax_spacing: true,
      tables: true
    }

    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
end
