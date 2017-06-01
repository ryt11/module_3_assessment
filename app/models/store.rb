class Store

  attr_reader :long_name, :city, :phone, :store_type, :distance
  def initialize(store_info = {})
    @long_name = store_info["longName"]
    @city = store_info["city"]
    @phone = store_info["phone"]
    @store_type = store_info["storeType"]
    @distance = store_info["distance"]
  end


  def self.stores_within_25_miles(zip)
    response = BestBuyService.new.stores_within_25_miles(zip)

    stores = response["stores"].map do |store|
      Store.new(store)
    end

    {stores: stores, total: response["total"]}
  end
end
