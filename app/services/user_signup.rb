class UserSignup

  attr_accessor :error_message

  def initialize(user)
    @user = user
  end

  def sign_up(stripe_token, invitation_token = nil)
    if @user.valid?
      customer = StripeWrapper::Customer.create(
        user: @user,
        source: stripe_token
      )
      if customer.successful? 
        @user.customer_token = customer.customer_token
        @user.save
        handle_invitation(invitation_token) if invitation_token
        send_welcome_message_email(@user)
        @status = :success 
      else
        @status = :failed
        @error_message = customer.error_message
      end
    else
      @status = :failed
      @error_message = "Invalid user information. Please check the errors below."
    end
    self
  end

  def successful?
    @status == :success
  end

private
  
  def handle_invitation(invitation_token)
    if invitation_token.present?
      invitation = Invitation.find_by(token: invitation_token)
      @user.follow(invitation.inviter)
      invitation.inviter.follow(@user)
      remove_token(invitation, :token)
    end
  end

  def remove_token(invitation, token)
      invitation.update_column(token, nil)
  end

  def send_welcome_message_email(user)
    AppMailer.delay.send_welcome_email(user)
  end
end
