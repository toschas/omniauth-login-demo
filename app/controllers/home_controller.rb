class HomeController < ApplicationController

  def show
    redirect_to notes_path if @current_user
  end

end
