# encoding: utf-8

class Request
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend ActiveModel::Translation

  attr_accessor :email, :message, :fullname

  validates_presence_of :fullname, :email, :message
  validates_format_of :fullname, :with => /\A([ёЁа-яА-Я]+\s*)+\z/
  validates_email_format_of :email

  def initialize(params = {})
    params.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def send_email
    RequestMailer.send_email(self).deliver
  end
end
