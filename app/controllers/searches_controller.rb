class SearchesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy

  def create
    @search = current_user.searches.build(params[:search])
      if @search.save
      flash[:success] = "Search created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @search.destroy
    redirect_back_or root_path
  end

  private
  
    def correct_user
      @search = current_user.searches.find_by_id(params[:id])
      redirect_to root_path if @search.nil?
    end
end

