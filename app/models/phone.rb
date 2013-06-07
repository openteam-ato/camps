class Phone < ActiveRecord::Base
  attr_accessible :number

  belongs_to :camp

  validates_presence_of :number

  alias_attribute :to_s, :number

end
