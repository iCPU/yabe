module Api
  module V1
    class YabeQueriesController < ApplicationController

      respond_to :json
      
      def index
        respond_with YabeQuery.all
      end
      
      def show
        respond_with YabeQuery.find(params[:id])
      end
      
      def create
        respond_with YabeQuery.create(params[:yabe_query])
      end
      
      def update
        respond_with YabeQuery.update(params[:id], params[:yabe_queries])
      end
      
      def destroy
        respond_with YabeQuery.destroy(params[:id])
      end  
    end
  end
end
