class SuggestionsController < ApplicationController
  expose :suggestion

  before_filter :authenticated

  def create
    suggestion.user = current_user
    suggestion.save
    respond_with(suggestion, location: comics_path)
  end
end
