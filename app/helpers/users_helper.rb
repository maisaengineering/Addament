module UsersHelper

  def get_img(e)
    link = (Nokogiri(e.summary)/"img").to_html

  end

end
