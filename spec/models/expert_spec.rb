require 'spec_helper'

describe Expert do

  context "validations" do
    it { should validate_presence_of(:hourly_rate) }
    it { should validate_numericality_of(:hourly_rate) }
  end

end
