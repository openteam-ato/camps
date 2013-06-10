class Photo < ActiveRecord::Base
  attr_accessible :image

  belongs_to :camp

  has_attached_file :image, :storage => :elvfs, :elvfs_url => Settings[:storage][:url]
end
