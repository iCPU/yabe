require 'spec_helper'

describe "YabeQueryPages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "query creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a query" do
        expect { click_button "Yabe it!" }.should_not change(YabeQuery, :count)
      end

      describe "error messages" do
        before { click_button "Yabe it!" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before do
        fill_in 'yabe_query_query', with: "Lorem ipsum"
        fill_in 'yabe_query_ebay_cat', with: "333" 
      end

      it "should create a query" do
        expect { click_button "Yabe it!" }.should change(YabeQuery, :count).by(1)
      end
    end
  end

  describe "query destruction" do
    before { FactoryGirl.create(:yabe_query, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a query" do
        expect { click_link "delete" }.should change(YabeQuery, :count).by(-1)
      end
    end
  end
end

