class Category < ActiveRecord::Base
  acts_as_nested_set

  attr_accessible :cat_id, :cat_name, :parent_id
end
