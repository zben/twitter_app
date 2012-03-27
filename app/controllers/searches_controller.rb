class SearchesController < ApplicationController
  def show
    keyword = params[:keyword] 
    keyword ||= params[:search][:keyword] if params[:search]
    @tweets = keyword.nil? ? [] : Searcher.search("##{keyword}", rpp: 10)
  end
end
