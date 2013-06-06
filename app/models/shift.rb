class Shift < ActiveRecord::Base
  attr_accessible :age_max, :age_min, :ends_on, :price, :starts_on, :title

  belongs_to :camp

  validates_presence_of :age_max, :age_min, :ends_on, :price, :starts_on, :title
end
