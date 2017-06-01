class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("https://api.bestbuy.com/v1/")
  end

  def stores_within_25_miles(zipcode)
    response = connection.get do |req|
     req.url "stores(area(#{zipcode},25))"
     req.params['format'] = 'json'
     req.params['show'] = 'longName,city,distance,phone,storeType'
     req.params['pageSize'] = 10
     req.params['apiKey'] = ENV['bb_api_key']
    end

    JSON.parse(response.body)
  end


  def total(total)
    StoreTotal.new()
  end

end
