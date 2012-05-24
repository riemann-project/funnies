# encoding: utf-8
module ApplicationHelper
  def admin_nav_link
    if controller_class == "posts"
      link_to "添加新博客", new_post_path
    else
      link_to "添加新漫画", new_comic_path
    end
  end
  
  private
  def controller_class
    controller.class.name.match(/(.+)Controller/)[1].downcase
  end

end
