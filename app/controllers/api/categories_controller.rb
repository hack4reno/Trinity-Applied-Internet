class Api::CategoriesController < ApplicationController
  before_filter :authenticate_user!
  def index
    ActiveRecord::Base.include_root_in_json = false
    render :json => current_user
  end
end
