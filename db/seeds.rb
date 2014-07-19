# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Province.delete_all
Person.delete_all

Province.create(
        [
         {name: 'Ontario', name_with_initial: 'ON'},
         {name: 'Quebec', name_with_initial: 'QC'},
         {name: 'Nova Scotia', name_with_initial: 'NS'},
         {name: 'New Brunswick', name_with_initial: 'NB'},
         {name: 'Manitoba', name_with_initial: 'MB'},
         {name: 'British Columbia', name_with_initial: 'BC'},
         {name: 'Prince Edward Island', name_with_initial: 'PE'},
         {name: 'Saskatchewan', name_with_initial: 'SK'},
         {name: 'Alberta', name_with_initial: 'AB'},
         {name: 'Newfoundland and Labrador', name_with_initial: 'NL'},
         {name: 'Northwest Territories', name_with_initial: 'NT'},
         {name: 'Yukon', name_with_initial: 'YT'},
         {name: 'Nunavut', name_with_initial: 'NU'}
	])
