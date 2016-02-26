require 'net/http'
require 'json'
# ^http to make the call, json to parse the respones into something we can use
class Rome2RioKayla
  @@url = "http://free.rome2rio.com/"
  def self.search term1,coords
    url = "#{@@url}/api/1.2/json/Search?key=2oi3U4vT&oName=#{coords}&dName=#{term1}"
    # ^these are dummy variables that are parameters for this method. this method search gets called in the home controller's SEARCH ACTION!!! the parameters are passed in as ARGUMENTS
    get_response url
  end

  def self.get_response url
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
  end
  private_class_method :get_response
end
