require 'spec_helper'

describe Category do
  pending "add some examples to (or delete) #{__FILE__}"
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

