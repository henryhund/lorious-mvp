require 'spec_helper'

describe Appointment do

  context "appointment creation" do

    it "calculates the number of credits based on the experts hourly rate and length" do
      expert = FactoryGirl.create(:expert, hourly_rate: 25)
      appointment = FactoryGirl.build(:appointment, expert: expert, length: 120)
      expect { appointment.save! }.to change{ appointment.number_of_credits }.from(nil).to(50)
    end

    it "changes the state to 'user_confirmed'" do
      appointment = FactoryGirl.build(:appointment)
      expect { appointment.save! }.to change{ appointment.state }.from(nil).to("user_confirmed")
    end

  end

  context "validations" do

    it "does not allow an appointment to be created if the user does not have enough credits" do
      user = FactoryGirl.create(:user, credit_balance: 24)
      expert = FactoryGirl.create(:expert, hourly_rate: 25)
      appointment = FactoryGirl.build(:appointment, requester: user, expert: expert, length: 60)
      expect { appointment.save! }.to raise_error(AppointmentError)
    end

    it "does not allow a user to create an appointment with himself" do
      expert = FactoryGirl.create(:expert, credit_balance: 100)
      appointment = FactoryGirl.build(:appointment, requester: expert, expert: expert, length: 60)
      expect { appointment.save! }.to raise_error(AppointmentError)
    end

  end

end
