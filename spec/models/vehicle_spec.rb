require 'rails_helper'

describe Vehicle  do
    before :each do
        @vehicle = build(:vehicle)  
    end

    it "should be valid if all info are good" do
        @vehicle.valid? 
    end

    it "should verify the validity of the license plate" do
        ok = ["TYT 676", "YRTY5664", "123456", "ABCDEFG"]
        bad = ["T!YT", "", "!@@##!"]
        
        ok.each do |plate|
            @vehicle.license_plate = plate
            expect(@vehicle).to be_valid
        end

        bad.each do |plate|
            @vehicle.license_plate = plate
            expect(@vehicle).not_to be_valid 
        end

    end

    it "should verify the validity of the colour" do
        ok = ["red", "blue", "dark royal blue of doom"]
        bad = ["fr3sca", "", "royal blue of doom!!!!!!!!!"]
        
        ok.each do |colour|
            @vehicle.colour = colour
            expect(@vehicle).to be_valid
        end

        bad.each do |colour|
            @vehicle.colour = colour
            expect(@vehicle).not_to be_valid
        end

    end
        
    it "should verify the validity of the make and model" do
        ok = ["Toyota", "RAV4", "SUNFIRE GT"] 
        bad = ["t()y()ta", "expensive car$"]
        
        ok.each do |name|
            @vehicle.make = name
            expect(@vehicle).to be_valid
            @vehicle.model = name
            expect(@vehicle).to be_valid
        end

        bad.each do |name|
            @vehicle.make = name
            expect(@vehicle).not_to be_valid
            @vehicle.model = name
            expect(@vehicle).not_to be_valid
        end

    end

    it "should let model be empty" do
        @vehicle.model = nil
        expect(@vehicle).to be_valid
    end

end
