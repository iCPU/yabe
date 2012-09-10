require "spec_helper"

describe "/api/v1/yabe_queries", :type => :api do
  let!(:user) { Factory(:user) }
  let!(:token) { user.authentication_token }
  let!(:yabe_query) { Factory(:yabe_query) }

  context "yabe_queries viewable by this user" do

    before do
      Factory(:yabe_query, :query => "Access Denied")
    end

    let(:url) { "/api/v1/yabe_queries" }
    let(:options) { { :except => :name, :methods => :title } }
    it "JSON" do
      get "#{url}.json", :token => token

      last_response.status.should eql(200)

      yabe_queries = JSON.parse(last_response.body)
      yabe_queries.any? do |p|
        p["query"] == yabe_query.query
      end.should be_true

    end
  end

  context "show" do
    let(:url) { "/api/v1/yabe_queries/#{yabe_query.id}"}
 
    it "JSON" do
      get "#{url}.json", :token => token
      yabe_query_json = yabe_query.to_json
      last_response.body.should eql(yabe_query_json)
      last_response.status.should eql(200)

      yabe_query_response = JSON.parse(last_response.body)

    end
  end

  context "updating a yabe_query" do

    let(:url) { "/api/v1/yabe_queries/#{yabe_query.id}" }
    it "successful JSON" do
      put "#{url}.json", :token => token,
                         :yabe_query => { 
                            :query => "Not Yabee"
                          }

      last_response.status.should eql(204)
      last_response.body.should eql("")

      yabe_query.reload
      yabe_query.query.should eql("Not Yabee")
    end

    it "unsuccessful JSON" do
      put "#{url}.json", :token => token,
                         :yabe_query => { 
                           :query => ""
                          }
      last_response.status.should eql(422)
      errors = { :errors => { :query => ["can't be blank"] } }
      last_response.body.should eql(errors.to_json)
    end
  end
end
