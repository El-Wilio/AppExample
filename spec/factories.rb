FactoryGirl.define do
  factory :vehicle do
    license_plate "JT6 GGH"
    colour  "red"
    make "Ford"
    model "Escape"
    year "2015"
  end
  factory :person do
    forename "William Alexander"
    surname  "Wright"
    street_address "398 Foran Street"
    province "QC"
    postal_code "j9j 2c2"
    city "Gatineau"
    telephone "8196841213"
  end
end
