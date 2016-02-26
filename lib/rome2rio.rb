require 'net/http'
require 'json'
# ^http to make the call, json to parse the respones into something we can use
class Rome2Rio
  @@url = "http://free.rome2rio.com/"
  def self.search term1, term2
    url = "#{@@url}/api/1.2/json/Search?key=2oi3U4vT&oName=#{term2}&dName=#{term1}"
    get_response url
  end

  def self.get_response url
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
    parsed["places"]
  end
  private_class_method :get_response
end

#marching orders
# 1.reverse geolocate the users location
# 2. set that to Oname automatically
# 3. keep ONE index box on the page for input dName
# 4.dName
