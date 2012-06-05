class Category < ActiveRecord::Base
  set_primary_key :ebay_cat_id
  has_ancestry
  attr_accessible :ebay_cat_id, :ebay_cat_name, :parent_id

def self.arrange_as_array(options={}, hash=nil)                                                                                                                                                            
    hash ||= arrange(options)

    arr = []
    hash.each do |node, children|
      arr << node
      arr += arrange_as_array(options, children) unless children.empty?
    end
    arr
  end 
end
