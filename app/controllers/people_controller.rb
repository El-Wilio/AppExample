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
        id = params[:id]
        if !id.nil? #we are viewing the profile of someone else
            user = User.find_by_id(id)
            if user.nil? 
                flash.now[:alert] = "This profile does not exist" 
                return 
            end

            @forename       = user.person.forename
            @surname        = user.person.surname
            @city           = user.person.city
            @province       = user.person.province
            @postal_code    = user.person.postal_code
            @telephone      = user.person.telephone  
            @street_address = user.person.street_address

        else #we are viewing our own personal profile
           if current_user.nil?
              flash.now[:alert] = "oops, you are not logged in yet!"
              return
           end

           @forename       = current_user.person.forename
           @surname        = current_user.person.surname
           @city           = current_user.person.city
           @province       = current_user.person.province
           @postal_code    = current_user.person.postal_code
           @telephone      = current_user.person.telephone  
           @street_address = current_user.person.street_address


        end
    end

    private

    def people_params 
        params.require(:person).permit(:regional, :first_half, :second_half,
               :forename, :surname, :street_address,
               :city, :province, :postal_code, :telephone)
    end


end
