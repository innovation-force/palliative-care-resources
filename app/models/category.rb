class Category < ActiveRecord::Base
  default_scope { order(name: :asc) }

  has_and_belongs_to_many :concerns
  has_and_belongs_to_many :services
  validates :name, presence: true
end
