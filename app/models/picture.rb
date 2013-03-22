class Picture < ActiveRecord::Base
	attr_accessible :title, :artist, :url, :copyrighted

    validates :title, :presence => true
    validates :url, { 
        :format => {
            :with => /^https?:/, :message => "Please Enter a Valid URL"
        }
    }

    scope :alphabetical, order("title ASC")
    scope :free, where(:copyrighted => false)
end