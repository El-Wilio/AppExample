require 'rails_helper'

RSpec.describe Person, :type => :model do
    before :each do
        @person = build(:person)
    end

   it "should let you save with all the correct info" do
      expect(@person).to be_valid
   end 

   it "should respect name format" do
       ok = ["Matthew", "D'Ario" "King, Jr.", "Saucage-Owen", " Jimmy " "King,            Jr."]
       bad = ["123" , "", "%$#% please", "a"]

       ok.each do |name|
           @person.forename = name
           @person.surname = name
           expect(@person).to be_valid
       end

       bad.each do |name|
           @person.forename = name
           @person.surname = name
           expect(@person).not_to be_valid
       end
   end

   it "should respect city format" do
       ok = ["Los Angeles", "San-Francisco" "Ottawa", "  Los Angeles   ", "San   Francisco"]
       bad = ["-LosAngeles", "123 city", "!!!!WOW TOWN"]

       ok.each do |city|
           @person.city = city
           expect(@person).to be_valid
       end

       bad.each do |city|
           @person.city = city
           expect(@person).not_to be_valid
       end
   end

   it "should respect province format" do
       ok = ["QC", "ON", "NS", "NB", "MB", "BC", "PE", "SK", "AB", "NL","NT", "YT", "NU"]

       ok.each do |province|
           @person.province = province
           expect(@person).to be_valid
       end 

   end

   it "should respect postal code format" do
       ok = ["j9j 2c2", "j9j2c2", " j9j h67" "y7y   5t5"]
       bad = ["9j9 c2c", "9j9c2c", "j9j", "2c2"]

       ok.each do |postal_code|
           @person.postal_code = postal_code
           expect(@person).to be_valid
       end

       bad.each do |postal_code|
           @person.postal_code = postal_code
           expect(@person).not_to be_valid
       end

   end
   
   it "should respect telephone format" do
       ok = ["6137711234", "6741231235"]
       bad = ["771-1234", "613(771)-1234", "613-771-1234", "61124534"]

       ok.each do |telephone|
           @person.telephone = telephone
           expect(@person).to be_valid
       end

       bad.each do |telephone|
           @person.telephone = telephone
           expect(@person).not_to be_valid
       end

   end    

   it "should respect the number of max vehicles" do
       @vehicle = Vehicle.new(license_plate: "5ty qrc", colour: "blue", 
                              make: "ford", model: "escape", year: "1994")
       @person.vehicles << @vehicle
       expect(@person).to be_valid
       @person.vehicles << @vehicle
       expect(@person).to be_valid
       @person.vehicles << @vehicle
       expect(@person).not_to be_valid
   end   

end
