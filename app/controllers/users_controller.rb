class UsersController < ApplicationController
  before_filter :require_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      handle_invitation

      Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      token = params[:stripeToken]

      begin
        charge = StripeWrapper::Charge.create(
          :amount => 999, # amount in cents, again
          :currency => "usd",
          :source => token,
          :description => "Sign up charge for #{@user.email}"
        )
      rescue Stripe::CardError => e
        flash[:error] = e.message
      end

      AppMailer.delay.send_welcome_email(@user)
      redirect_to sign_in_path
    else
      render :new
    end
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end

  def new_with_invitation_token
    invitation = Invitation.find_by(token: params[:token])
    if invitation
      @user = User.new(email: invitation.recipient_email)
      @invitation_token = invitation.token
      render :new
    else
      redirect_to expired_token_path
    end
  end

  private
    
  def user_params
    params.require(:user).permit(:email, :password, :full_name)
  end
  
  def handle_invitation
    if params[:invitation_token].present?
      invitation = Invitation.find_by(token: params[:invitation_token])
      @user.follow(invitation.inviter)
      invitation.inviter.follow(@user)
      remove_token(invitation, :token)
    end
  end
  
  def remove_token(invitation, token)
      invitation.update_column(token, nil)
  end
end
