class Register < ActiveRecord::Base
  attr_accessible :attachment, :title

  validates_presence_of :title, :attachment

  has_attached_file :attachment, :storage => :elvfs, :elvfs_url => Settings[:storage][:url]
end
