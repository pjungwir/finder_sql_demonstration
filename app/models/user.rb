class User < ActiveRecord::Base

  has_many :articles
  has_many :tags, -> {distinct}, through: :articles

end
