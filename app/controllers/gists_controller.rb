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
    
    @gist = Gist.new
  end

  def create
    @gist = current_user.gists.build(
      author: params[:gist][:author],
      link: params[:gist][:link],
      content: params[:gist][:content],
      )

    if @gist.save
      flash[:notice] = 'Saved in your gists\' list'
      redirect_to account_path
    else
      render 'new'
    end
  end
  
end
