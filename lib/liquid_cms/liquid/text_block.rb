module LiquidCms
  class TextBlockLiquid < Liquid::Tag
    def initialize(tag_name, text_block_key, tokens)
      super
      @text_block_key = text_block_key
      @text_block = TextBlock.find_by_key(text_block_key.to_s.strip)
    end

    def render(context)
      if @text_block.present?
        @text_block.body
      else
        "{ text block '#{@text_block_key}' is missing }"
      end
    end
  end
end

Liquid::Template.register_tag('text_block', LiquidCms::TextBlockLiquid)
