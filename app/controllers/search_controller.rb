class SearchController < ApplicationController

  def index
  end

  def new

  end

  def create
    store_info = Store.stores_within_25_miles(search_params["parameter"])
    @stores = store_info[:stores]
    @total = store_info[:total]
    render :index, locals: { stores: @stores, total: @total }
  end

  private

  def search_params
    params.require(:search).permit(:parameter)
  end
end
