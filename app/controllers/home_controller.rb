require "#{Rails.root}/lib/rome2rio.rb"

class HomeController < ApplicationController
  def index
    # @str = "https://maps.googleapis.com/maps/api/streetview?size=600x300&location=#{dest}&heading=151.78&pitch=-0.76&key=AIzaSyAL3tGbNJnkQPnEp5KRfIUi-TOJ6-LWZ0I"
  end

  def search
    @results= Rome2RioKayla.search(params[:coords],params[:query])
    # puts @results
    render 'index', @results
  end
end
