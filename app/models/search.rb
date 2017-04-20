class Search < ActiveRecord::Base
    has_many :tweets

    def search_compare
      current = Search.last.search
      matches = Search.where(search: current)
    end
end
