require 'rails_helper'

RSpec.describe 'shelters related pages', type: :feature do

  it 'the pets index page shows a list of all the pets' do 
    
    info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80203'} 
    shelter1 = Shelter.create!(info1)
    info2 = {:name => 'Cuttest Puppy Rescue', :address => '729th E 10th Avenue' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
    shelter2 = Shelter.create!(info2)
    info3 = {:name => 'Desperate Puppy Rescue', :address => '1931 Larimer Street' , :city => 'Denver' , :state => 'CO', :zip => '80201'} 
    shelter3 = Shelter.create!(info3)    

    pet1_info = {:name => 'Rusky', :age => 4 , :sex => 'M' , :shelter => shelter1, :image => 'https://www.sheknows.com/wp-content/uploads/2018/08/fajkx3pdvvt9ax6btssg.jpeg', :description => 'not cool' }
    pet1 = Pet.create!(pet1_info)
    pet2_info = {:name => 'Brusher', :age => 3 , :sex => 'F' , :shelter => shelter2, :image => 'http://www.pethealthnetwork.com/sites/default/files/hemorrhagic-gastroenteritis-hge-looms-large-over-small-dogs-487505995.jpg', :description => "sticky"} 
    pet2 = Pet.create!(pet2_info)

    visit "/pets"

    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.shelter.name)
    expect(page).to have_css("img[src*='#{pet1.image}']")

    expect(page).to have_content(pet2.name)
    expect(page).to have_content(pet2.age)
    expect(page).to have_content(pet2.sex)
    expect(page).to have_content(pet2.shelter.name)
    expect(page).to have_css("img[src*='#{pet2.image}']")
  end

  it 'the shelter pets index page shows a list of all the pets for that shelter' do 

    info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80203'} 
    shelter1 = Shelter.create!(info1)
    info2 = {:name => 'Cuttest Puppy Rescue', :address => '729th E 10th Avenue' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
    shelter2 = Shelter.create!(info2)
    info3 = {:name => 'Desperate Puppy Rescue', :address => '1931 Larimer Street' , :city => 'Denver' , :state => 'CO', :zip => '80201'} 
    shelter3 = Shelter.create!(info3)    

    pet1_info = {:name => 'Rusky', :age => 4 , :sex => 'M' , :shelter => shelter1, :image => 'skhf.img', :status => 'pending', :description => 'horrible'}
    pet1 = Pet.create!(pet1_info)
    pet2_info = {:name => 'Brusher', :age => 3 , :sex => 'F' , :shelter => shelter2, :image => 'sdfskhf.img', :status => 'adoptable', :description => 'aggressive'} 
    pet2 = Pet.create!(pet2_info)

    pet3_info = {:name => 'Silly', :age => 9 , :sex => 'M' , :shelter => shelter1, :image => 'skasdhf.img', :status => 'pending', :description => 'on fire'}
    pet3 = Pet.create!(pet3_info)
    pet4_info = {:name => 'Goofy', :age => 7 , :sex => 'F' , :shelter => shelter2, :image => 'sdfasdskhf.img', :status => 'adoptable', :description => 'mean'} 
    pet4 = Pet.create!(pet4_info)

    visit "/shelters/#{shelter1.id}/pets"
    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.shelter.name)
    expect(page).to have_css("img[src*='#{pet1.image}']")

    expect(page).to have_content(pet3.name)
    expect(page).to have_content(pet3.age)
    expect(page).to have_content(pet3.sex)
    expect(page).to have_content(pet3.shelter.name)
    expect(page).to have_css("img[src*='#{pet3.image}']")
  end


  it "the show page of pets provides all the pet information" do

    info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80203'} 
    shelter1 = Shelter.create!(info1)
    info2 = {:name => 'Cuttest Puppy Rescue', :address => '729th E 10th Avenue' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
    shelter2 = Shelter.create!(info2)
    info3 = {:name => 'Desperate Puppy Rescue', :address => '1931 Larimer Street' , :city => 'Denver' , :state => 'CO', :zip => '80201'} 
    shelter3 = Shelter.create!(info3)

    pet1_info = {:name => 'Rusky', :age => 4 , :sex => 'M' , :shelter => shelter1, :image => 'skhf.img', :status => 'pending', :description => 'horrible'}
    pet1 = Pet.create!(pet1_info)
    pet2_info = {:name => 'Brusher', :age => 3 , :sex => 'F' , :shelter => shelter2, :image => 'sdfskhf.img', :status => 'adoptable', :description => 'aggressive'} 
    pet2 = Pet.create!(pet2_info)
    pet3_info = {:name => 'Silly', :age => 9 , :sex => 'M' , :shelter => shelter1, :image => 'skasdhf.img', :status => 'pending', :description => 'on fire'}
    pet3 = Pet.create!(pet3_info)
    pet4_info = {:name => 'Goofy', :age => 7 , :sex => 'F' , :shelter => shelter2, :image => 'sdfasdskhf.img', :status => 'adoptable', :description => 'mean'} 
    pet4 = Pet.create!(pet4_info)

    visit "/pets/#{pet1.id}"

    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.description)
    expect(page).to have_content(pet1.status)
    expect(page).to have_css("img[src*='#{pet1.image}']")
  end

  it "the pet update page allows users to update pet's information" do

    info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80203'} 
    shelter1 = Shelter.create!(info1)
    info2 = {:name => 'Cuttest Puppy Rescue', :address => '729th E 10th Avenue' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
    shelter2 = Shelter.create!(info2)
    info3 = {:name => 'Desperate Puppy Rescue', :address => '1931 Larimer Street' , :city => 'Denver' , :state => 'CO', :zip => '80201'} 
    shelter3 = Shelter.create!(info3)

    pet1_info = {:name => 'Rusky', :age => 4 , :sex => 'M' , :shelter => shelter1, :image => 'skhf.img', :status => 'pending', :description => 'horrible'}
    pet1 = Pet.create!(pet1_info)

    visit "/pets/#{pet1.id}"

    click_link "Update Pet"

    expect(page).to have_current_path("/pets/#{pet1.id}/edit")

    expect(page).to have_content("Name:")
    expect(page).to have_content("Age:")
    expect(page).to have_content("Description:")
    expect(page).to have_content("Sex:")
    expect(page).to have_content("Image:")

    fill_in 'name', with: 'Snoopy'
    fill_in 'age', with: '14'
    fill_in 'description', with: 'Nasty'
    fill_in 'sex', with: 'female'
    fill_in 'image', with: 'some_image_path'

    click_button "Update Pet"

    expect(page).to have_current_path("/pets/#{pet1.id}")

    expect(page).to have_content("Name: Snoopy")
    expect(page).to have_content("Age: 14")
    expect(page).to have_content("Description: Nasty")
    expect(page).to have_content("Sex: female")
    expect(page).to have_css("img[src*='some_image_path']")

    expect(page).to_not have_content("Name: Rusky")
    expect(page).to_not have_content("Age: 4")
    expect(page).to_not have_content("Description: horrible")
    expect(page).to_not have_content("Sex: M")
  end

  it "The pet show page has a delete button that allows to destroy a pet" do 

    info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80203'} 
    shelter1 = Shelter.create!(info1)

    pet1_info = {:name => 'Rusky', :age => 4 , :sex => 'M' , :shelter => shelter1, :image => 'skhf.img', :status => 'pending', :description => 'horrible'}
    pet1 = Pet.create!(pet1_info)
    pet2_info = {:name => 'Brusher', :age => 3 , :sex => 'F' , :shelter => shelter1, :image => 'sdfskhf.img', :status => 'adoptable', :description => 'aggressive'} 
    pet2 = Pet.create!(pet2_info)

    visit "/pets/#{pet1.id}"

    click_link "Delete Pet"
    
    expect(page).to have_current_path("/pets")

    expect(page).to_not have_content("Name: Rusky")

  end

  it "formats_input" do

    info1 = {:name => "Meg's Shelter", :address => '150 Main Street' , :city => 'Hershey' , :state => 'PA', :zip => '17033'} 
    shelter1 = Shelter.create(info1)

    visit "/shelters/#{shelter1.id}/pets"

    click_link "Create Pet"

    fill_in 'name', with: 'Snoopy'
    fill_in 'age', with: '14'
    fill_in 'description', with: 'Nasty'
    fill_in 'sex', with: 'female'
    fill_in 'image', with: 'some_image_path'

    click_button "Create Pet"
      
    expect(page).to have_current_path("/shelters/#{shelter1.id}/pets")

    expect(page).to have_content("Name: Snoopy")
    expect(page).to have_content("Age: 14")
    expect(page).to have_content("Description: Nasty")
    expect(page).to have_content("Sex: F")
    expect(page).to have_css("img[src*='some_image_path']")
  end

end