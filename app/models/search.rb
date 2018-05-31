class Search < ApplicationRecord
  def self.find(query)
    query = ThinkingSphinx::Query.escape(query) if query.present?
    ThinkingSphinx.search(query)
  end
end
