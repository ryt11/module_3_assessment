class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("https://api.bestbuy.com/v1/stores")
  end

  def method_name

  end


end
