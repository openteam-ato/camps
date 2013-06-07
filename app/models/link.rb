class Link < ActiveRecord::Base
  attr_accessible :title, :url

  belongs_to :camp

  validates_presence_of :title, :url
end
