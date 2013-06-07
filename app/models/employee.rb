class Employee < ActiveRecord::Base
  attr_accessible :full_name, :phone_number, :post

  belongs_to :camp

  validates_presence_of :full_name, :post

  def to_s
    [].tap do |s|
      s << full_name
      s << post
      s << "тел.: #{phone_number}" if phone_number.present?
    end.join(', ')
  end
end
