# encoding: utf-8

class Camp < ActiveRecord::Base
  extend Enumerize

  attr_accessible :address, :description, :kind, :title,
    :address_attributes, :phones_attributes, :seasons_attributes, :links_attributes, :employees_attributes

  has_many :employees, :dependent => :destroy, :order => 'created_at ASC'
  has_many :photos,    :dependent => :destroy, :order => 'created_at ASC'
  has_many :links,     :dependent => :destroy, :order => 'created_at ASC'
  has_many :phones,    :dependent => :destroy
  has_many :seasons,    :dependent => :destroy, :order => 'created_at ASC'

  has_one :address, :dependent => :destroy

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :employees, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :links,     :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :phones,    :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :seasons,    :allow_destroy => true, :reject_if => :all_blank

  validates_presence_of :title, :kind

  # TODO: выпилить на лето загородные лагеря
  #enumerize :kind, :in => [:country, :sanatorium, :day, :encampment], :scope => true
  enumerize :kind, :in => [:country, :sanatorium, :encampment], :scope => true

  delegate :address_line, :district, :to => :address
  alias_attribute :to_s, :title

  searchable do
    date :starts_on_min
    date :ends_on_max

    integer :age_min
    integer :age_max
    integer :price_min

    string(:districts, :multiple => true) { [district] }
    string(:kinds, :multiple => true) { [kind] }
    string :title

    text :title
  end

  def phones_line
    phones.any? ? phones.join(', ') : 'телефон не указан'
  end

  def self.query
    @params.delete :commit
    @params.delete :page

    @params
  end

  def self.sunspot_search(params)
    @params = params.dup
    ages = %w[5_9 10_15]
    periods = %w[june july august]

    age = ages.include?(params[:age]) ? params[:age] : nil
    period = periods.include?(params[:period]) ? Time.zone.parse(params[:period]) : nil

    search {
      with :districts, [params[:district]] if params[:district].present?
      with :kinds, [params[:kind]] if params[:kind].present?

      if age.present?
        with(:age_min).greater_than_or_equal_to age.split('_').first
        with(:age_max).less_than_or_equal_to age.split('_').last
      end

      if period.present?
        with(:starts_on_min).greater_than_or_equal_to period.beginning_of_month
        with(:starts_on_min).less_than_or_equal_to period.end_of_month
      end

      # TODO: выпилить на лето загородные лагеря
      without :kinds, :day

      case params[:order_by]
      when 'starts_on'
        order_by :starts_on_min, :asc
      when 'price'
        order_by :price_min, :asc
      else
        order_by :title, :asc
      end

      paginate :page => params[:page] || 1, :per_page => 10
    }
  end

  private

  def age_min
    seasons.pluck(:age_min).min
  end

  def age_max
    seasons.pluck(:age_max).max
  end

  def starts_on_min
    seasons.pluck(:starts_on).min
  end

  def ends_on_max
    seasons.pluck(:ends_on).max
  end

  def price_min
    seasons.pluck(:price_min).min
  end
end
