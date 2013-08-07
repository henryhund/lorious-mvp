require 'spec_helper'

describe Authentication do

 	context "validations" do

 		it "does not allow a user to have multiple authentications from the same provider" do
 			auth1 = FactoryGirl.create(:twitter_authentication, user_id: 1)
 			auth2 = FactoryGirl.build(:twitter_authentication, user_id: 1, uid: "t12346")
 			auth2.should have(1).error_on(:provider)
 		end

 		it "does not allow the same uid to be saved if a uid of the same provider exists" do
 			auth1 = FactoryGirl.create(:twitter_authentication)
 			auth2 = FactoryGirl.build(:twitter_authentication, user_id: 999999)
 			auth2.should have(1).error_on(:uid)
 		end

 	end

end
