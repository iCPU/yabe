class StaticPagesController < ApplicationController
  def home
    @search = current_user.searches.build if signed_in?  
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
