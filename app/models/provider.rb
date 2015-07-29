class Provider < ActiveRecord::Base
  default_scope { order(name: :asc) }
end
