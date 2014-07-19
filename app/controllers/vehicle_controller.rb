class VehicleController < ApplicationController
  def new

      if current_user.nil?
          redirect_to "/login", alert: "you need to login before adding a vehicle"
          return
      end

      if current_user.person.nil?
          redirect_to "/people/new", alert: "you need to fill in your personal info before
            adding a vehicule."
          return
      end

      @vehicle = Vehicle.new
  end

  def create
      if current_user.person.nil?
          return
      end
      @vehicle = Vehicle.new(vehicle_params)
      @vehicle.person_id = current_user.person.id

      if current_user.person.vehicles << @vehicle
          redirect_to "/profile", notice: "you have succesfully registered your car."
      else
          if @vehicle.errors.include?(:person)
             redirect_to "/profile", alert: "You already have two cars."
          else
             redirect_to "/vehicle/new", alert: "Please fill in the form correctly."
          end 
      end

  end  

  def view
  end
end

private

def vehicle_params
    params.require(:vehicle).permit(:license_plate, :colour, :make, :model, :year)
end

