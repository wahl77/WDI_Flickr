class StaticPagesController < ApplicationController
  skip_before_filter :require_login, only:[:index]
  def index
    @current_users = current_users.map {|u| u.username}.join(", ")
  end
end
