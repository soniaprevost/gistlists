module GistsHelper

  def gist_author(gist)
    params[:search] ? gist.css('div.byline span.creator a').attribute('href').value.gsub!('/', '').upcase : gist.author
  end

  def gist_link(gist)
    params[:search] ? parse_content(gist).css('a').attribute('href').value : gist.link
  end

  def gist_content(gist)
    params[:search] ? parse_content(gist).css('div.file-box div').first : gist.content
  end

  def parse_content(gist)
    gist.css('div.js-gist-file-update-container')
  end
end
