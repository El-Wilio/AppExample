class UserController < ApplicationController
    def view
        if !params[:id] == ""
            flash[:notice] = params[:id]
        else
            flash[:notice] = "your personal profile"       
        end
end
