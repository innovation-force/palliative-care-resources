class Service < ActiveRecord::Base
  default_scope { order(title: :asc) }

  belongs_to :provider
  has_and_belongs_to_many :categories

  # TODO: Replace with a scope
  # Couldn't figure out how to do an exclusive query on habtm within deadline :(
  def self.find_by_categories(category_ids)
    services = Service.includes(:provider, :categories).all
    results = []
    services.each do |service|
      good = true
      category_ids.each do |category|
        good = false unless service.category_ids.include?(category.to_i)
      end
      if good == true
        results << service
      end
    end
    return results
  end
end
