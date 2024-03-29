xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    if params[:username]
      xml.title "The Funnies - #{params[:username]}'s Feed"
    else
      xml.title "The Funnies Main Feed"
    end
    xml.description "所有您所喜欢的漫画，都在这里！^_^"
    xml.link comics_url

    if comics.any?
      comics.each do |comic|
        xml.item do
          xml.title comic.name
          if comic.comic_strips.any?
            xml.description raw(image_tag(comic.comic_strips.last.comic_image_url))
          else
            xml.description "不好意思，该系列漫画还没有连载。"
          end
          xml.pubDate comic.created_at.to_s(:rfc822)
          xml.link comic.homepage
          xml.guid comics_url
        end
      end
    end
  end
end
