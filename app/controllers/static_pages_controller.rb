class StaticPagesController < ApplicationController
  def home
    if signed_in? 
      @ebay_cat_id = params[:ebay_cat_id]
      @ebay_cat_name = params[:ebay_cat_name]
      @yabe_query = current_user.yabe_queries.build
      @feed_items = current_user.feed.limit(4)

#      @search = Category.search do
  
#        fulltext params[:search]
#        paginate(:per_page => 10, :page => params[:page])
    
#   #    order_by(:parent_id, :asc)
#        order_by(:ancestry, :asc)
#        order_by(:ebay_cat_name, :asc)
    
#      end
      
      @categories = Category.all

    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
