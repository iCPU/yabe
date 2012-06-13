class YabeQueriesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy

  def create
    @yabe_query = current_user.yabe_queries.build(params[:yabe_query])
    if @yabe_query.save
      flash[:success] = "Search passed to the wizard, results due back soon, please wait..."
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @yabe_query.destroy
    redirect_back_or root_path
  end

  private
  
    def correct_user
      @yabe_query = current_user.yabe_queries.find_by_id(params[:id])
      redirect_to root_path if @yabe_query.nil?
    end
end

