require 'spec_helper'

describe Search do

    let(:user) { FactoryGirl.create(:user) }
    before { @search = user.searches.build(query: "Lorem ipsum", category: "34") }

  subject { @search }

  it { should respond_to(:query) }
  it { should respond_to(:category) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Search.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
    before { @search.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank query" do
    before { @search.query = " " }
    it { should_not be_valid }
  end

  describe "with query that is too long" do
    before { @search.query = "a" * 141 }
    it { should_not be_valid }
  end
  
  describe "with category that is too long" do
    before { @search.category = '1' * 10 }
    it { should_not be_valid }
  end
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
# Indexes
#
#  index_searches_on_user_id_and_created_at  (user_id,created_at)
#

