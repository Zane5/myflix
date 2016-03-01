require 'spec_helper'

describe UserSignup do
  describe "#sign_up" do
    context "valid personal info and valid card" do
      let(:charge) { double(:charge, successful?: true) }
      
      before do
        StripeWrapper::Charge.should_receive(:create).and_return(charge)
      end

      after { ActionMailer::Base.deliveries.clear }

      it "creates the user" do
        UserSignup.new(Fabricate.build(:user)).sign_up("some_stripe_token", nil)
        expect(User.count).to eq(1)
      end

      it "makes user follow the inviter" do
        alice = Fabricate(:user)
        invitation = Fabricate(:invitation, inviter: alice, recipient_email: 'joe@example.com')
        UserSignup.new(Fabricate.build(:user, email: 'joe@example.com', password: "password", full_name: "Joe Doe")).sign_up("some_stripe_token", invitation.token)
        joe = User.find_by(email: 'joe@example.com')
        expect(joe.follows?(alice)).to be_truthy
      end

      it "makes inviter follow the user" do
        alice = Fabricate(:user)
        invitation = Fabricate(:invitation, inviter: alice, recipient_email: 'joe@example.com')
        UserSignup.new(Fabricate.build(:user, email: 'joe@example.com', password: "password", full_name: "Joe Doe")).sign_up("some_stripe_token", invitation.token)
        joe = User.find_by(email: 'joe@example.com')
        expect(alice.follows?(joe)).to be_truthy
      end
     
      it "expires the invitation upon acceptance" do
        alice = Fabricate(:user)
        invitation = Fabricate(:invitation, inviter: alice, recipient_email: 'joe@example.com')
        UserSignup.new(Fabricate.build(:user, email: 'joe@example.com', password: "password", full_name: "Joe Doe")).sign_up("some_stripe_token", invitation.token)
        joe = User.find_by(email: 'joe@example.com')
        expect(Invitation.first.token).to be_nil
      end

      it "sends out email to the user with valid inpust" do
        UserSignup.new(Fabricate.build(:user, email: 'joe@example.com')).sign_up("some_stripe_token", nil)
        expect(ActionMailer::Base.deliveries.last.to).to eq(['joe@example.com'])
      end

      it "sends out email containing the user name with valid inputs" do
        UserSignup.new(Fabricate.build(:user, full_name: "Joe Smith", email: 'joe@example.com')).sign_up("some_stripe_token", nil)
        expect(ActionMailer::Base.deliveries.last.body).to include("Joe Smith")
      end
    end

    context "valid personal and declined card" do
      it "does not create a new user record" do
        charge = double(:charge, successful?: false, error_message: "Your card was declined.")
        allow(StripeWrapper::Charge).to receive(:create).and_return(charge)
        UserSignup.new(Fabricate.build(:user)).sign_up("1231232", "default_invitation_token")
        expect(User.count).to eq(0)
      end
    end

    context "with invalid personal info" do
      before do
        UserSignup.new(User.new(email: "z@example.com")).sign_up("1231232", "default_invitation_token")
      end

      it "does not create the user" do
        expect(User.count).to eq(0)
      end

      it "does not charge the card" do
        expect(StripeWrapper::Charge).not_to receive(:create)
      end

      it "does not send out email with invalid inputs" do
        expect(ActionMailer::Base.deliveries).to be_empty
      end
    end
  end
end
