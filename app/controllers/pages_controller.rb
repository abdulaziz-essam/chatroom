class PagesController < ApplicationController
  def home
    begin
      # Debugging current_user in the controller
      puts "Current User in Controller: #{current_user.inspect}"

      # You can also inspect specific attributes of the user
      if current_user
        puts "Current User ID: #{current_user.id}"
        puts "Current User Email: #{current_user.email}"
      else
        puts "No user is signed in."
      end
    rescue StandardError => e
      # Log any exception that occurs during the current_user inspection
      puts "Error occurred while accessing current_user: #{e.message}"
      puts e.backtrace.join("\n")  # Print the backtrace for debugging
    end
  end
end
