class ComicStrip < ActiveRecord::Base
  belongs_to :comic

  validates_presence_of :comic, :comic_image

  attr_accessible :comic_id

  mount_uploader :comic_image, ComicImageUploader

  def md5_hash
    read_attribute(:md5_hash) || generate_md5!
  end
  
  private
  def generate_md5!
    save! if new_record?
    hash = Digest::MD5.hexdigest(File.read(comic_image.current_path))
    update_attribute(:md5_hash, hash)
    hash
  end
end
