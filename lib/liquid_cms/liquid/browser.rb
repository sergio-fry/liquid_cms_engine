module LiquidCms
  class BrowserLiquid < Liquid::Block
    def initialize(tag_name, target_browser, tokens)
      super
      @target_browser = target_browser.strip
    end

    def render(context)
      browser = Browser.new( :user_agent => context["user_agent"] )

      if browser.send("#{@target_browser}?")
        super
      else
        ""
      end
    end
  end
end

class Browser
  def to_liquid
    self
  end
end

Liquid::Template.register_tag('browser', LiquidCms::BrowserLiquid)

