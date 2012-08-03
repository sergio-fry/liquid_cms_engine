module LiquidCms
  # Render TextBlock by key 'footer':
  # {% text_block footer %}
  class TextBlockLiquid < Liquid::Tag
    def initialize(tag_name, text_block_key, tokens)
      super
      @text_block_key = text_block_key
      @text_block = TextBlock.find_by_key(text_block_key.to_s.strip)
    end

    def render(context)
      if @text_block.present?
        Liquid::Template.parse(@text_block.body).render({})
      else
        "{ text block '#{@text_block_key}' is missing }"
      end
    end
  end
end

Liquid::Template.register_tag('text_block', LiquidCms::TextBlockLiquid)
