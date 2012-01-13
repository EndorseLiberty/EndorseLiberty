Rails::Engine.mixin __FILE__
class WelcomeController < ApplicationController
  def watched
    @tracker.log(:video_watched, "User watched video")
    increment_page
    redirect_to welcome_path
  end

  def done_sharing
    @tracker.log(:done_sharing, "User advanced past the sharing page")
    increment_page
    redirect_to welcome_path
  end

  # Overwriting the default SeedBlocks register method.  This is because we don't want to validate on email address
  # for "already taken".  Instead, we want to just allow those people through to the next step
  def register
    if request.post?
      @user.update_attributes params['user']
      if @user.valid?
        after_register
        redirect_to welcome_path and return
      else
        if @user.errors[:email].include?("Already Taken")
          # Look up the already-existing user, set the current tracker to that user, and send them along
          right_user = User.where(:email => @user.email).first
          @tracker.user_id = right_user.id
          cookies[:user_id] = right_user.id
          @user = right_user
          @tracker.log(:existing_user_shared_again, "Existing user #{@user.email} got into the landing path again.")
        else
          @tracker.log(:failed_register, "User creation failed with message: #{@user.errors.full_messages.join(", ")}")
        end
      end
    end
    render_path_page
  end


  private

  def sb_after_register
    if @user.webmail?
      session[:email_pwd] = @user.email_password
    else
      session[:skip_importing] = true
    end
  end

  def sb_after_inviting_contacts
    session[:skip_importing] = true
  end
end