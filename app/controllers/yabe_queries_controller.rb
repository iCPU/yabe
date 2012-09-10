class YabeQueriesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy


  def index
    @yabe_queries = YabeQuery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yabe_queries }
    end
  end


  # PUT /yabe_queries/1
  # PUT /yabe_queries/1.json
  def update

    @yabe_query = YabeQuery.find(params[:id])

    if @yabe_query.update_attributes(params[:yabe_query])
      flash[:notice] = "YabeQuery has been updated."
      redirect_to @yabe_query
    else
      flash[:alert] = "YabeQuery has not been updated."
      render :action => "edit"
    end
  end
 
  # GET /yabe_queries/1
  # GET /yabe_queries/1.json
  def show
    @yabe_query = YabeQuery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yabe_query }
    end
  end



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

