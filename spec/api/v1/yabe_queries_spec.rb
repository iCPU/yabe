require "spec_helper"

describe "/api/v1/yabe_queries", :type => :api do
  let!(:user) { Factory(:user) }
  let!(:token) { user.authentication_token }
  let!(:yabe_query) { Factory(:yabe_query) }

  before do
    user.permissions.create!(:action => "view", :thing => yabe_query)
  end

  context "yabe_queries viewable by this user" do

    before do
      Factory(:yabe_query, :query => "Access Denied")
    end

    let(:url) { "/api/v2/yabe_queries" }
    let(:options) { { :except => :name, :methods => :title } }
    it "JSON" do
      get "#{url}.json", :token => token

      body = YabeQuery.for(user).to_json(options)

      last_response.body.should eql(body)
      last_response.status.should eql(200)

      yabe_queries = JSON.parse(last_response.body)
      yabe_queries.any? do |p|
        p["title"] == yabe_query.title
      end.should be_true

      yabe_queries.all? do |p|
        p["name"].blank? 
      end.should be_true
    end

    it "XML" do
      get "#{url}.xml", :token => token

      body = YabeQuery.for(user).to_xml(options)
      last_response.body.should eql(body)
      yabe_queries = Nokogiri::XML(last_response.body)
      yabe_queries.css("yabe_query title").text.should eql(yabe_query.title)
      yabe_queries.css("yabe_query name").text.should eql("")
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
    before do
      user.admin = true
      user.save
    end

    let(:url) { "/api/v1/yabe_queries/#{yabe_query.id}" }
    it "successful JSON" do
      put "#{url}.json", :token => token,
                         :yabe_query => { 
                            :query => "Not Yabee"
                          }

      last_response.status.should eql(204)
      last_response.body.should eql("")

      yabe_query.reload
      yabe_query.name.should eql("Not Yabee")
    end

    it "unsuccessful JSON" do
      put "#{url}.json", :token => token,
                         :yabe_query => { 
                           :name => ""
                          }
      last_response.status.should eql(422)
      errors = { :errors => { :query => ["can't be blank"] } }
      last_response.body.should eql(errors.to_json)
    end
  end
end
