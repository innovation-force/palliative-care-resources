class Tag < ActiveRecord::Base
  default_scope { order(name: :asc) }

  has_and_belongs_to_many :resources
end
