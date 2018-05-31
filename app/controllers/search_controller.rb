class SearchController < ApplicationController
  def index
    query = params[:query]
    @resources = Search.find(query)
  end
end
