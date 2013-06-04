class Camp < ActiveRecord::Base
  extend Enumerize

  attr_accessible :address, :description, :district, :kind, :title

  validates_presence_of :title, :kind

  enumerize :kind, :in => [:country, :sanatorium, :day]
end
