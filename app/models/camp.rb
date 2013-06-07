class Camp < ActiveRecord::Base
  extend Enumerize

  attr_accessible :address, :description, :kind, :title,
    :address_attributes, :phones_attributes, :shifts_attributes, :links_attributes, :employees_attributes

  has_many :employees, :dependent => :destroy
  has_many :links,     :dependent => :destroy
  has_many :phones,    :dependent => :destroy
  has_many :shifts,    :dependent => :destroy

  has_one :address, :dependent => :destroy

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :employees, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :links,     :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :phones,    :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :shifts,    :allow_destroy => true, :reject_if => :all_blank

  validates_presence_of :title, :kind

  enumerize :kind, :in => [:country, :sanatorium, :day]

  delegate :address_line, :district, :to => :address

  searchable do

  end
end
