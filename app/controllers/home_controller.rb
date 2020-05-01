class HomeController < ApplicationController
  def home
      if current_user
        redirect_to items_path
        # or render some content directly in this response
        render :items_path
      else # no logged-in user
        render root_path
        # same, render or redirect
      end
    end
  end
end
