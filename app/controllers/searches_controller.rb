class SearchesController < ApplicationController
  before_filter :signed_in_user

  def create
    @search = current_user.searches.build(params[:search])
      if @search.save
      flash[:success] = "Search created!"
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
end

