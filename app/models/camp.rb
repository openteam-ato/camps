class Camp < ActiveRecord::Base
  extend Enumerize

  attr_accessible :address, :description, :kind, :title, :address_attributes, :phones_attributes

  has_many :phones, :dependent => :destroy

  has_one :address, :dependent => :destroy

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones, :allow_destroy => true, :reject_if => :all_blank

  validates_presence_of :title, :kind

  enumerize :kind, :in => [:country, :sanatorium, :day]

  delegate :address_line, :district, :to => :address
end
