class CategoriesConcerns < ActiveRecord::Base
  belongs_to :category
  belongs_to :concern
end
