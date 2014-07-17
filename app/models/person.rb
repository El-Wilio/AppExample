class Person < ActiveRecord::Base

    attr_accessor :regional, :first_half, :second_half
    belongs_to :user
    has_many :vehicles
    before_validation :clear_whitespaces, :capitalizer  

    validates :forename, length: {in: 2..60}, format: {
        with: %r{\A[a-z ,.'-]+\z}i,
        message: "not a valid name"
    }

    validates :surname, length: {in: 2..60}, format: {
        with: %r{\A[a-z ,.'-]+\z}i,
        message: "not a valid name"
    }

    validates :street_address, format: {
        with: %r{\A[0-9]{1,6} [a-z]+( [a-z]+)*( App# [0-9]{1,4})?\z}i,
        message: "not a valid street address format"
    }

    validates :city, format: {
        with: %r{\A[a-z]+([\s-]?[a-z]+)*\z}i,
        message: "not a valid city format"
     }

    validates :province, format: {
        with: %r{(ON|QC|NS|NB|MB|BC|PE|SK|AB|NL|NT|YT|NU)},
        message: "not a valid province format"
    }

    validates :postal_code, format: {
        with: %r{[a-z][0-9][a-z] ?[0-9][a-z][0-9]}i,
        message: "not a valid postal code format"
    }

    validates :telephone, format: {
        with: %r{[0-9]{10}}i,
        message: "not a valid telephone format"
    }
 
    validates_each :vehicles do |user, attr, value|
        user.errors.add attr, "too much vehicles for user" if user.vehicles.size > 2
    end

    protected
    
     #because there is a risk that the user will use double spaces or add a space at the end, we need to trim some of the attributes
  #so it may pass the validation test
    def clear_whitespaces
        #trim the attributes
        self.forename.strip!
        self.surname.strip!
        self.street_address.strip!
        self.city.strip!
        self.postal_code.strip!
        #then remove all multiple spaces within the value
        self.forename.gsub!(/\s+/,' ') 
        self.surname.gsub!(/\s+/,' ') 
        self.street_address.gsub!(/\s+/,' ') 
        self.city.gsub!(/\s+/,' ') 
        self.postal_code.gsub!(/\s+/,' ') 
    end

    def capitalizer
        self.forename.capitalize!
        self.surname.capitalize!
        self.street_address.capitalize!
        self.city.capitalize!
        self.postal_code.upcase!
    end

end
