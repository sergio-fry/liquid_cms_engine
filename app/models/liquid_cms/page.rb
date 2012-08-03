module LiquidCms
  class Page < ActiveRecord::Base
    attr_accessible :body, :slug, :title
    validates :slug, :presence => true, :uniqueness => true
    validates :title, :presence => true
  end
end
