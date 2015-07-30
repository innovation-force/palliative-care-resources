class Provider < ActiveRecord::Base
  default_scope { order(name: :asc) }

  has_many :services
end
