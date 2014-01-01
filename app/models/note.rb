class Note < ActiveRecord::Base
  concerning :MarkdownRendering do
    def render_markdown
      markdown_processor.render(raw_body)
    end

    private
    def markdown_processor
      @markdown_processor ||= Redcarpet::Markdown.new(
        Redcarpet::Render::HTML.new(
          filter_html:         true,
          hard_wrap:           true,
          fenced_code_blocks:  true,
          underline:           true,
          highlight:           true,
        ),
        autolink:  true,
        tables:    true,
      )
    end
  end
end
