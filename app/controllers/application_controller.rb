class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Devise's helper to authenticate users before any action
  before_action :authenticate_user!  # Ensure users are authenticated before accessing any page

  # You don't need to define current_user, log_in, log_out, or logged_in? manually.
  # Devise automatically handles this for you.
end
