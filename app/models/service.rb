class Service < ActiveRecord::Base
	belongs_to :provider
	has_and_belongs_to_many :categories
	has_many :comments
end
