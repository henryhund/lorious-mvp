require 'spec_helper'

describe AppointmentRequest do

  context "appointment request creation" do

    it "calculates the number of credits based on the experts hourly rate and length" do
      expert = FactoryGirl.create(:expert, hourly_rate: 25)
      appointment_request = FactoryGirl.build(:appointment_request, expert: expert, length: 120)
      expect { appointment_request.save! }.to change{ appointment_request.number_of_credits }.from(nil).to(50)
    end

  end

  context "validations" do

    it "does not allow an appointment to be created if the user does not have enough credits" do
      user = FactoryGirl.create(:user, credit_balance: 24)
      expert = FactoryGirl.create(:expert, hourly_rate: 25)
      appointment_request = FactoryGirl.build(:appointment_request, requester: user, expert: expert, length: 60)
      expect { appointment_request.save! }.to raise_error(AppointmentRequestError)
    end

  end

end
