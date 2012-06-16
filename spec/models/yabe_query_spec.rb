require 'spec_helper'

describe YabeQuery do

    let(:user) { FactoryGirl.create(:user) }
    before { @yabe_query = user.yabe_queries.build(query: "Lorem ipsum", ebay_cat: "34") }

  subject { @yabe_query }

  it { should respond_to(:query) }
  it { should respond_to(:ebay_cat) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        YabeQuery.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
    before { @yabe_query.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank query" do
    before { @yabe_query.query = " " }
    it { should_not be_valid }
  end

  describe "with query that is too long" do
    before { @yabe_query.query = "a" * 141 }
    it { should_not be_valid }
  end
  
  describe "with category that is too long" do
    before { @yabe_query.ebay_cat = '1' * 10 }
    it { should_not be_valid }
  end
end
