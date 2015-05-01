class Service < ActiveRecord::Base
	belongs_to :providers
	has_and_belongs_to_many :categories
	validates :title, presence: true 
end
