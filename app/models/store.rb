class Store
  def initialize(store_info = {})
    @long_name = store_info["longName"]
    @city = store_info["city"]
    @phone = store_info["phone"]
    @store_type = store_info["storeType"]
    @distance = store_info["distance"]
  end


  def self.stores_within_25_miles(zip)
    response = BestBuyService.new.stores_within_25_miles(zip)
    
    x = response["stores"].map do |store|
      Store.new(store)
    end

  end
end
