# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
info1 = {:name => "Mike's Shelter", :address => '1331 17th Street' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
shelter1 = Shelter.create(info1)
info2 = {:name => "Meg's Shelter", :address => '150 Main Street' , :city => 'Hershey' , :state => 'PA', :zip => '17033'} 
shelter2 = Shelter.create(info2)

pet1_info = {:name => 'Athena', :age => 1 , :sex => 'F' , :shelter => shelter1, :image => 'skhf.img', :status => 'pending', :description => 'butthead'}
pet1 = Pet.create!(pet1_info)


pet2_info = {:name => 'Odell', :age => 4 , :sex => 'M' , :shelter => shelter2, :image => 'skhf.img', :status => 'pending', :description => 'good dog'}
pet2 = Pet.create!(pet2_info)
