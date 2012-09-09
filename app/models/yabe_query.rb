class YabeQuery < ActiveRecord::Base
  attr_protected :user_id

  belongs_to :user
  

  validates :query, presence: true, length: { maximum: 140 }
  validates :ebay_cat, length: { maximum: 9 }
  validates :user_id, presence: true

  default_scope order: 'yabe_queries.created_at DESC'
end

