module ApplicationHelper

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language = default)
      if language.nil?
        language = :default
      end
      
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :lax_html_blocks => true,
      :strikethrouhg => true,
      :superscript => true
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe unless text.nil?
  end
end
