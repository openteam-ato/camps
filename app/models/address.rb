class Address < ActiveRecord::Base
  extend Enumerize

  attr_accessible :address, :district

  belongs_to :camp

  validates_presence_of :address, :district

  enumerize :district, :in => [:tomsk, :asino]
end
