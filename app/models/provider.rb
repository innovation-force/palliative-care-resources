class Provider < ActiveRecord::Base
	has_many :services, :dependent => :destroy
	accepts_nested_attributes_for :services, allow_destroy: true
end

