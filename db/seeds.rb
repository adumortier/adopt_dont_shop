# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80203'} 
shelter1 = Shelter.create(info1)
info2 = {:name => 'Cuttest Puppy Rescue', :address => '729th E 10th Avenue' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
shelter2 = Shelter.create(info2)
info3 = {:name => 'Desperate Puppy Rescue', :address => '1931 Larimer Street' , :city => 'Denver' , :state => 'CO', :zip => '80201'} 
shelter3 = Shelter.create(info3)