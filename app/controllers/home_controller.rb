require "#{Rails.root}/lib/rome2rio/"

class HomeController < ApplicationController
  def index
  end

  def search
    @results= Rome2RioKayla.search(params[:query],params[:coords])
    puts @results
    render 'index'
  end
end
