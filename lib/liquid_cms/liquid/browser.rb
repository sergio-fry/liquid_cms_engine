module LiquidCms
  # Render block only if user browser matches 
  # specified conditions:
  #
  # {% browser webkit %}
  #   Only Webkit
  # {% endbrowser %}
  #
  # {% browser windows firefox %}
  #   Only Windows Firefox
  # {% endbrowser %}
  #
  # {% browser chrome !android %}
  #   Chrome not Android
  # {% endbrowser %}
  #
  # Full list of conditions:
  #   capable - Return true if browser supports some CSS 3 (Safari, Firefox, Opera & IE7+).
  #   webkit
  #   ios
  #   mobile
  #   quicktime - Detect if browser is QuickTime
  #   blackberry
  #   core_media - Detect if browser is Apple CoreMedia.
  #   iphone
  #   ipad
  #   ipod
  #   tablet - Detect if browser is tablet (currently just iPad or Android).
  #   safari
  #   firefox
  #   chrome
  #   ie
  #   ie6
  #   ie7
  #   ie8
  #   ie9
  #   psp
  #   opera
  #   mac
  #   windows
  #   linux
  #   android
  #
  class BrowserLiquid < Liquid::Block
    def initialize(tag_name, target_browser, tokens)
      super
      @target_browser = target_browser.split
    end

    def render(context)
      browser = Browser.new( :user_agent => context["user_agent"] )

      conditions = @target_browser.map{ |el| el[0] == "!" ? !browser.send("#{el[1..-1]}?") : browser.send("#{el}?") }

      if conditions.detect{ |el| el == false }.nil?
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

