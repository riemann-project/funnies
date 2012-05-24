# encoding: utf-8
class SubscriptionsController < ApplicationController

  expose(:comic) { Comic.find(params[:comic_id]) }

  def create
    current_user.subscribe!(comic)
    redirect_to comics_path, :notice => "订阅 #{comic.name} 成功！"
  end

  def destroy
    current_user.unsubscribe!(comic)
    redirect_to comics_path, :notice => "取消订阅 #{comic.name} 成功！"
  end
end
