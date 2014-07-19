class HomeController < ApplicationController
  def index
      if !current_user.nil?
          if current_user.person.nil?
              redirect_to "/people/new", notice: "Please fill out your personal info before proceeding."
          end
      end
  end

  def about
  end

  def contact
  end
end
