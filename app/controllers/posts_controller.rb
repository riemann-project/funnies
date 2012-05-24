class PostsController < InheritedResources::Base
  before_filter :authenticated, except: :index
  before_filter :authenticate_admin, except: :index

  expose :post
  expose(:posts) { Post.all }

  def create
    post.user = current_user
    if post.save
      redirect_to collection_url 
    else
      render :new
    end
  end

  def update
    update! { collection_url }
  end

end
