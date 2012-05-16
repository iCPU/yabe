class Search < ActiveRecord::Base
  attr_accessible :category, :query
  
  belongs_to :user

  validates :query, presence: true, length: { maximum: 140 }
  validates :category, length: { maximum: 9 }
  validates :user_id, presence: true

  default_scope order: 'searches.created_at DESC'
end
# == Schema Information
#
# Table name: searches
#
#  id         :integer         not null, primary key
#  query      :string(255)
#  category   :integer
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

