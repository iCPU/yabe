class Category < ActiveRecord::Base
  set_primary_key :ebay_cat_id
  has_ancestry
  attr_accessible :ebay_cat_id, :ebay_cat_name, :parent_id

  
#  searchable do
#    text :ebay_cat_name
#    integer :id
#    integer :parent_id
#    string :ebay_cat_name
#    string :ancestry
#  end


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
# == Schema Information
#
# Table name: categories
#
#  id            :integer         not null
#  ebay_cat_name :string(255)
#  ebay_cat_id   :integer         primary key
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  ancestry      :string(255)
#  parent_id     :integer
#
# Indexes
#
#  index_categories_on_ancestry  (ancestry)
#

