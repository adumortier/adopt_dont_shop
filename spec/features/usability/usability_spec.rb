require 'rails_helper'

RSpec.describe "usability of views", type: :feature do

   it "the shelter names can be clicked on any page to view the shelter information" do 

    info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
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
    click_link("shelter_#{shelter1.id}_link")
    expect(page).to have_current_path("/shelters/#{shelter1.id}")

    visit '/shelters'
    click_link("shelter_#{shelter1.id}_link")
    expect(page).to have_current_path("/shelters/#{shelter1.id}") 

  end


  it "Every page has a pet index link at the top" do 

    info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
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

    visit "/"
    click_link("All Pets")
    expect(page).to have_current_path("/pets")

    visit "/shelters"
    click_link("All Pets")
    expect(page).to have_current_path("/pets") 

    visit "/shelters"
    click_link("New Shelter")
    click_link("All Pets")
    expect(page).to have_current_path("/pets") 

    visit "/pets/#{pet1.id}"
    click_link("All Pets")
    expect(page).to have_current_path("/pets") 
    
    visit "/pets/#{pet1.id}/edit"
    click_link("All Pets")
    expect(page).to have_current_path("/pets") 

    visit "/shelters/#{shelter1.id}/pets"
    click_link("Create Pet")
    click_link("All Pets")
    expect(page).to have_current_path("/pets") 

    visit "/shelters/new"
    click_link("All Pets")
    expect(page).to have_current_path("/pets") 

    visit "/shelters/#{shelter1.id}"
    click_link("All Pets")
    expect(page).to have_current_path("/pets") 

    visit "/shelters/#{shelter1.id}/edit"
    click_link("All Pets")
    expect(page).to have_current_path("/pets") 


  end

  it "the pets index pages have edit links next to every pet" do 

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

    visit "/pets"

    within("span#pet_#{pet3.id}") do
      click_link "Edit"
    end

    expect(page).to have_current_path("/pets/#{pet3.id}/edit")

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

    expect(page).to have_current_path("/pets/#{pet3.id}")

    expect(page).to have_content("Name: Snoopy")
    expect(page).to have_content("Age: 14")
    expect(page).to have_content("Description: Nasty")
    expect(page).to have_content("Sex: female")
    expect(page).to have_css("img[src*='some_image_path']")

    expect(page).to_not have_content("Name: Rusky")
    expect(page).to_not have_content("Age: 4")
    expect(page).to_not have_content("Description: horrible")
    expect(page).to_not have_content("Sex: M")
    expect(page).to_not have_css("img[src*='skhf.img']")

    visit "/shelters/#{shelter2.id}/pets"

    within("span#pet_#{pet4.id}") do
      click_link "Edit"
    end

    expect(page).to have_current_path("/pets/#{pet4.id}/edit")
  end

  it "the pets index pages have delete links next to every pet" do 

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

    visit "/pets"

    within("span#pet_#{pet1.id}") do
      click_link "Delete"
    end
    expect(page).to have_current_path("/pets")
    expect(page).to_not have_content("Name: Rusky")


    visit "/shelters/#{shelter2.id}/pets"
    within("span#pet_#{pet4.id}") do
      click_link "Delete"
    end

    expect(page).to_not have_content("Name: Goofy")

  end

  it "Pets can be clicked on every page" do 

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

    visit "/pets"
    click_link("pet_#{pet1.id}_link")
    expect(page).to have_current_path("/pets/#{pet1.id}")

    visit "/shelters/#{shelter1.id}/pets"
    click_link("pet_#{pet1.id}_link")
    expect(page).to have_current_path("/pets/#{pet1.id}") 

  end

  it 'each view page has a link to the shelter index at the top' do 
    info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
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

    visit "/"
    click_link("All Shelters")
    expect(page).to have_current_path("/shelters")

    visit "/shelters"
    click_link("New Shelter")
    click_link("All Shelters")
    expect(page).to have_current_path("/shelters") 

    visit "/pets/#{pet1.id}"
    click_link("All Shelters")
    expect(page).to have_current_path("/shelters") 
    
    visit "/pets/#{pet1.id}/edit"
    click_link("All Shelters")
    expect(page).to have_current_path("/shelters") 

    visit "/shelters/#{shelter1.id}/pets"
    click_link("Create Pet")
    click_link("All Shelters")
    expect(page).to have_current_path("/shelters") 

    visit "/shelters/new"
    click_link("All Shelters")
    expect(page).to have_current_path("/shelters") 

    visit "/shelters/#{shelter1.id}"
    click_link("All Shelters")
    expect(page).to have_current_path("/shelters") 

    visit "/shelters/#{shelter1.id}/edit"
    click_link("All Shelters")
    expect(page).to have_current_path("/shelters") 

  end

  it 'The shelter show page has a link to the shelter pet index' do 

    info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
    shelter1 = Shelter.create!(info1)

    pet1_info = {:name => 'Rusky', :age => 4 , :sex => 'M' , :shelter => shelter1, :image => 'skhf.img', :status => 'pending', :description => 'horrible'}
    pet1 = Pet.create!(pet1_info)

    pet2_info = {:name => 'Silly', :age => 9 , :sex => 'M' , :shelter => shelter1, :image => 'skasdhf.img', :status => 'pending', :description => 'on fire'}
    pet2 = Pet.create!(pet2_info)

    visit "/shelters/#{shelter1.id}"
    click_link("Our Pets")
    expect(page).to have_current_path("/shelters/#{shelter1.id}/pets")
  end
end



