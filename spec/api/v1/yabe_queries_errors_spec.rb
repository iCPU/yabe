require "spec_helper"

describe "YabeQuery API errors", :type => :api do
  context "standard users" do 
    let(:user) { Factory(:user) }

    it "cannot create yabe_queries" do
      post "/api/v1/yabe_queries.json", 
        :token => user.authentication_token,
        :yabe_query => {
          :rstr1 => "Test String"
        }
      error = { :error => "I pity the fool that tries to create a Yabe Query" }
      last_response.body.should eql(error.to_json)
      last_response.status.should eql(401)
    end
  end
end

