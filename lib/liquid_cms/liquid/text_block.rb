module LiquidCms
  # Render TextBlock by key 'footer':
  # {% text_block footer %}
  class TextBlockLiquid < Liquid::Tag
    def initialize(tag_name, arguments, tokens)
      super

      @text_block_key = arguments.strip.split.first
      @text_block = TextBlock.find_by_key(@text_block_key)

      variables_array = arguments.scan(/([a-z0-9_]+)="([^"]*)"/i).flatten
      @variables = Hash[*variables_array]
    end

    def render(context)
      if @text_block.present?
        @variables.each { |k, v| context[k] = v }
        Liquid::Template.parse(@text_block.body).render(context)
      else
        "{ text block '#{@text_block_key}' is missing }"
      end
    end
  end
end

Liquid::Template.register_tag('text_block', LiquidCms::TextBlockLiquid)
