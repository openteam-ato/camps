class Camp < ActiveRecord::Base
  extend Enumerize

  attr_accessible :address, :description, :kind, :title, :address_attributes

  has_one :address

  accepts_nested_attributes_for :address

  validates_presence_of :title, :kind

  enumerize :kind, :in => [:country, :sanatorium, :day]
end
