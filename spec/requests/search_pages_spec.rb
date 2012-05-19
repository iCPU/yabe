require 'spec_helper'

describe "SearchPages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "search creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a search" do
        expect { click_button "Search" }.should_not change(Search, :count)
      end

      describe "error messages" do
        before { click_button "Search" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before do
        fill_in 'search_query', with: "Lorem ipsum"
        fill_in 'search_category', with: "333" 
      end

      it "should create a search" do
        expect { click_button "Search" }.should change(Search, :count).by(1)
      end
    end
  end

  describe "search destruction" do
    before { FactoryGirl.create(:search, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a search" do
        expect { click_link "delete" }.should change(Search, :count).by(-1)
      end
    end
  end
end
