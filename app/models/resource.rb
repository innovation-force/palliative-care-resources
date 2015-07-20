class Resource < ActiveRecord::Base
  default_scope { order(name: :asc) }

  has_and_belongs_to_many :tags

  # TODO: Replace with a scope
  # Couldn't figure out how to do an exclusive query on habtm within deadline :(
  def self.find_by_tags(tag_ids)
    resources = Resource.includes(:tags)
    results = []
    resources.each do |resource|
      good = true
      tag_ids.each do |tag|
        good = false unless resource.tag_ids.include?(tag.to_i)
      end
      if good == true
        results << resource
      end
    end
    return results
  end
end
