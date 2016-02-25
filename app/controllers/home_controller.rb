require "#{Rails.root}/lib/rome2rio/"

class HomeController < ApplicationController
  def index
  end

  def search
    @results= Rome2Rio.search(params[:query])
    puts @results
    render 'index'
  end
end
