require 'open-uri'

class Comic < ActiveRecord::Base
  has_many :subscriptions, dependent: :destroy
  has_many :readers, through: :subscriptions, source: :user
  has_many :comic_strips, dependent: :destroy

  validates_presence_of :name, :homepage, :comic_page
  validates :xpath_title, presence: true, xpath: true
  validates :xpath_image, presence: true, xpath: true

  attr_accessible :name, :homepage, :comic_page, :xpath_title, :xpath_image

  def update_strip
    if source_image_url.present?
      hash = Digest::MD5.hexdigest(open(source_image_url).read)
      unless ComicStrip.find_by_md5_hash(hash) # if didn't have, create it!
        comic_strips.create(:remote_comic_image_url => source_image_url)
      end
    end
  end
  
  private # I add it

  def source_image_url
    # get the page, after get the image url. if is abs path return it, else add homepage to it
    begin
      doc = Nokogiri::HTML(open(self.comic_page))
      image_url = doc.xpath("#{xpath_image}/@src").to_s
      return unless image_url.present?
      unless image_url.match(/^http:\/\//)
        image_url = "#{self.homepage}/#{image_url}"
      end
      image_url
    rescue Exception => e
      if !Rails.env.development? && defined?(HoptoadNotifier)
        HoptoadNotifier.notify(
          :error_class   => "Comic#source_image_url",
          :error_message => "Failed to parse image via XPath: #{e.message}",
          :parameters    => { "name" => name, "xpath_image" => xpath_image }
        )
      end
      logger.info "failed to parse image:", e
      nil
    end
  end
end
