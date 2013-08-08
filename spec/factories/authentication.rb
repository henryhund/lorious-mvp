FactoryGirl.define do

	factory :authentication do
		association :user, factory: :user

		factory :twitter_authentication do
			provider "twitter"
			uid "t12345"
		end

		factory :google_authentication do
			provider "google"
			uid "g12345"
		end

		factory :facebook_authentication do
			provider "facebook"
			uid "f12345"
		end

		factory :linkedin_authentication do
			provider "linkedin"
			uid "l12345"
		end

	end

end
