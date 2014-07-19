class PeopleController < ApplicationController
    def new
        @person = Person.new
    end

    def create
        if Person.find_by_id(current_user.id)
          flash[:alert] = "oops, you already registered your info"  
          return 
        end
        @person = Person.new(people_params)
        @person.user_id = current_user.id
        @person.telephone = params[:person][:regional] +
        params[:person][:first_half] +
        params[:person][:second_half]

        if @person.save
            redirect_to "/", notice: "you have succesfully registered your personal info"
        else
           redirect_to "/people/new", alert: "Please make sure all the fields are filled in correctly"
        end

        

    end

    def view
       if current_user.nil?
           flash.now[:alert] = "oops, you are not logged in yet!"
           return
       end
         
       if current_user.person.nil?
           redirect_to '/people/new', alert: "OOPS, make sure to fill in your info before proceeding"
           return 
        end

        @vehicles = current_user.person.vehicles
        @forename       = current_user.person.forename
        @surname        = current_user.person.surname
        @city           = current_user.person.city
        @province       = current_user.person.province
        @postal_code    = current_user.person.postal_code
        @telephone      = current_user.person.telephone  
        @street_address = current_user.person.street_address

    end

    private

    def people_params 
        params.require(:person).permit(:regional, :first_half, :second_half,
               :forename, :surname, :street_address,
               :city, :province, :postal_code, :telephone)
    end


end
