require "#{Rails.root}/lib/rome2rio.rb"

class HomeController < ApplicationController
  def index
  end

  def search
    p params[:query]
    @results= Rome2RioKayla.search(params[:coords],params[:query])
    # puts @results
    render 'index'
  end
end
