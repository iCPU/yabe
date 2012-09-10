class Api::V1::YabeQueriesController < Api::V1::BaseController
  before_filter :find_yabe_query, :only => [:show, :update, :destroy]

  def index
    yabe_queries = YabeQuery.all
    respond_with(yabe_queries, :except => :name, :methods => :title)
  end

  def create
    yabe_query = YabeQuery.new(params[:yabe_query])
    if yabe_query.save
      respond_with(yabe_query, :location => api_v1_yabe_query_path(yabe_query))
    else
      respond_with(yabe_query)
    end
  end

  def show
    respond_with(@yabe_query)
  end

  def update
    @yabe_query.update_attributes(params[:yabe_query])
    respond_with(@yabe_query)
  end

  def destroy
    @yabe_query.destroy
    respond_with(@yabe_query)
  end

  private

  def find_yabe_query
    @yabe_query = YabeQuery.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      error = { :error => "The yabe_query you were looking for " +
                          "could not be found."}
      respond_with(error, :status => 404)
  end
end
