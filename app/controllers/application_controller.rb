# encoding: utf-8
require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder # Configuring your own responder

  protect_from_forgery

  layout :layout_by_resource

  def authenticated # login required
    redirect_to root_url unless user_signed_in?
  end

  def authenticate_admin # admin required
    unless current_user.admin?
      redirect_to :back, alert: "非法操作，您无权限进行此操作。"
    end
  end

  private

  def after_sign_in_path_for(resource_or_scope) # overwrite, which in devise
    case resource_or_scope
    when :user, User
      user_comics_path(:username => current_user.username)
    else
      super
    end
  end

  def layout_by_resource
    if devise_controller?
      "session"
    else
      "application"
    end
  end
end
