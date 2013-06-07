class Employee < ActiveRecord::Base
  attr_accessible :full_name, :phone_number, :post

  belongs_to :camp

  validates_presence_of :full_name, :post
end
