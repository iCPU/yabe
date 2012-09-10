require "spec_helper"

describe "API errors", :type => :api do

  it "making a request with no token" do
    get "/api/v1/yabe_queries.json", :token => ""
    error = "HTTP Token: Access denied.\n" 
    last_response.body.should eql(error)
  end

end
