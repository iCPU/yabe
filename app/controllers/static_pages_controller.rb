class StaticPagesController < ApplicationController
  def home
    if signed_in? 
      @yabe_query = current_user.searches.build
      @feed_items = current_user.feed.limit(4)
      @categories = Category.all
      @category = Category.first
   

      @search = Category.search do
  
        fulltext params[:search]
        paginate(:per_page => 10, :page => params[:page])
    
   #    order_by(:parent_id, :asc)
        order_by(:ancestry, :asc)
        order_by(:ebay_cat_name, :asc)
    
      end
      
      @categories = @search.results

    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
