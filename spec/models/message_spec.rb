require 'spec_helper'

describe Message do

  context "scopes" do

    context "#in_reply_to(message)" do

      it "lists all the messages that are part of the reply chain of a parent message" do
        parent_message = FactoryGirl.create(:message_from_user_to_expert)
        message_reply = parent_message.replies.create!(to_user: parent_message.from_user, from_user: parent_message.to_user, body: "this is a response")
        Message.in_reply_to(parent_message).should include(message_reply)
      end

    end

  end

end
