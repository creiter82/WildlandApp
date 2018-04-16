class PagesController < ApplicationController
  def home
    @users = User.where(approved: false)
  end
end
