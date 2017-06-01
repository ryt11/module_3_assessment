class SearchController < ApplicationController

  def index

  end

  def new

  end

  def create
    stores = Store.stores_within_25_miles(search_params["parameter"])    
  end

  private

  def search_params
    params.require(:search).permit(:parameter)
  end
end
