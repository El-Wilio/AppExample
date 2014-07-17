class HomeController < ApplicationController
  def index
      if !current_user.nil?
          if Person.find_by_id(current_user.id).nil?
              redirect_to "/people/new", notice: "Please fill out your personal info before proceeding."
          end
      end
  end

  def about
  end

  def contact
  end
end
