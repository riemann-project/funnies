class ComicsController < InheritedResources::Base
  respond_to :rss, only: :index

  before_filter :authenticate_unless_rss
  before_filter :authenticate_admin, except: :index

  expose :comic
  expose(:comics) do
    User.find_by_username(params[:username]).try(:comics) || Comic.all
  end

  def create
    create! { collection_url }
  end

  def update
    update! { collection_url }
  end

  private
  def authenticate_unless_rss
    authenticated unless request.format.to_s[/rss/]
  end
  hide_action :authenticate_unless_rss
end
