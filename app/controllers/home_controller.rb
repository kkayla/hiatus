require "#{Rails.root}/lib/rome2rio.rb"

class HomeController < ApplicationController
  def index
    # @str = "https://maps.googleapis.com/maps/api/streetview?size=600x300&location=#{dest}&heading=151.78&pitch=-0.76&key=AIzaSyAL3tGbNJnkQPnEp5KRfIUi-TOJ6-LWZ0I"
  end
  def search
    @results= Rome2RioKayla.search(params[:coords],params[:query])
    listCountryCode = @results['places'][1]['countryCode']
    RSpotify::authenticate("ab28d4a1f6d843cbac32cca55f276abb", "22df4d4b2ccd4c8e948de0cb50c182e9")
    @featured_playlists = RSpotify::Playlist.browse_featured(country: listCountryCode)
    puts @featured_playlists
    puts listCountryCode
    # puts @results
    render 'index'
  end
end
