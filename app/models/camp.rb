# encoding: utf-8

class Camp < ActiveRecord::Base
  extend Enumerize

  attr_accessible :address, :description, :kind, :title,
    :address_attributes, :phones_attributes, :shifts_attributes, :links_attributes, :employees_attributes

  has_many :employees, :dependent => :destroy, :order => 'created_at ASC'
  has_many :photos,    :dependent => :destroy, :order => 'created_at ASC'
  has_many :links,     :dependent => :destroy
  has_many :phones,    :dependent => :destroy
  has_many :shifts,    :dependent => :destroy, :order => 'created_at ASC'

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
    date :starts_on_min
    date :ends_on_max

    integer :age_min
    integer :age_max

    string(:districts, :multiple => true) { [district] }
    string(:kinds, :multiple => true) { [kind] }

    text :title
  end

  def phones_line
    phones.any? ? phones.join(', ') : 'телефон не указан'
  end

  private

  def age_min
    shifts.pluck(:age_min).min
  end

  def age_max
    shifts.pluck(:age_max).max
  end

  def starts_on_min
    shifts.pluck(:starts_on).min
  end

  def ends_on_max
    shifts.pluck(:ends_on).max
  end
end
