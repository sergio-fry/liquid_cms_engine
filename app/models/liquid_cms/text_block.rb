module LiquidCms
  class TextBlock < ActiveRecord::Base
    attr_accessible :body, :key
    validates :key, :presence => true, :uniqueness => true
  end
end
