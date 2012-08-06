module LiquidCms
  class ApplicationController < ActionController::Base
    before_filter :authenticate

    # always allow
    def authenticate
      true
    end
  end
end
