require 'open-uri'

class GistsController < ApplicationController

  def index
    if params[:search]
      search_url = "https://gist.github.com/search?q=#{params[:search][:query]}"
      doc = Nokogiri::HTML(open(search_url))
      @gists = doc.css('div.gist-snippet')
    else
      @gists = Gist.all
    end
  end
  
end
