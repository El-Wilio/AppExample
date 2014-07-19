class Vehicle < ActiveRecord::Base
    belongs_to :person
    validates_associated :person, :message => "You already have two cars"

    before_validation :clear_whitespaces, :capitalizer, :trim_plate 

    validates :license_plate, format: {
        with: %r{\A[a-z0-9]+(\s[a-z0-9]+)*\z}i,
        message: "not a valid license plate format"
     }

    validates :colour, length: {in: 3..50}, format: {
        with: %r{\A[a-z]+(\s[a-z]+)*\z}i,
        message: "not a valid colour format."
    }

    validates :make, length: {in:3..50}, format: {
        with: %r{\A[a-z0-9]+(\s[a-z0-9]+)*\z}i,
        message: "not a valid make format"
    }

    validates :model, format: {
        with: %r{\A(|[a-z0-9]+(\s[a-z0-9]+)*)\z}i,
        message: "not a valid model format"
    }, allow_nil: true

    validates :year, format: {
        with: %r{[0-9]{4}},
        message: "not a valid year format"
    }

    protected

    def clear_whitespaces
        #trim the attributes
        self.license_plate.strip!
        self.colour.strip!
        self.make.strip!
        self.model.strip!
        #then remove all multiple spaces within the value
        self.license_plate.gsub!(/\s+/,' ') 
        self.colour.gsub!(/\s+/,' ') 
        self.make.gsub!(/\s+/,' ') 
        self.model.gsub!(/\s+/,' ') 
    end

    def capitalizer
        self.license_plate.upcase!
        self.colour.downcase!
        self.make.capitalize!
        self.model.capitalize!
    end

    def trim_plate
        self.license_plate.gsub!(/[^a-zA-Z\d]/, '')
    end

end
