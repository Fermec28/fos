module ApplicationHelper
  class HtmlWithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      sha = Digest::SHA1.hexdigest(code)
      Rails.cache.fetch ["code", language, sha].join('-') do
        Pygments.highlight(code, lexer: language)
      end
    end
  end

  def markdown(text)
    renderer = HtmlWithPygments.new(hard_wrap: true, filter_html: false)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def bootstrap_class_for(flash_type)
    flash_types = { success: "alert-success",
                    error: "alert-danger",
                    alert: "alert-warning",
                    notice: "alert-info" }
    flash_types[flash_type.to_sym] || alert-block
  end
end
