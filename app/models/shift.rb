class Shift < ActiveRecord::Base
  attr_accessible :age_max, :age_min, :ends_on, :price_min, :price_max, :starts_on, :title

  belongs_to :camp

  validates_presence_of :age_max, :age_min, :ends_on, :price_min, :starts_on, :title
end
