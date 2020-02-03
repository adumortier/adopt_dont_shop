require 'rails_helper'

RSpec.describe 'shelters functionalities', type: :feature do

  it 'the shelters index page shows a list of all the shelters' do 
    
      info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80203'} 
      shelter1 = Shelter.create!(info1)
      info2 = {:name => 'Cuttest Puppy Rescue', :address => '729th E 10th Avenue' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
      shelter2 = Shelter.create!(info2)
      info3 = {:name => 'Desperate Puppy Rescue', :address => '1931 Larimer Street' , :city => 'Denver' , :state => 'CO', :zip => '80201'} 
      shelter3 = Shelter.create!(info3)
      visit "/shelters"

      expect(page).to have_content(shelter1.name)
      expect(page).to have_content(shelter2.name)
      expect(page).to have_content(shelter3.name)
  end

  it "the shelter show page displays the name, address, city and state of the selected shelter" do 

      info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80203'} 
      shelter1 = Shelter.create!(info1)
    
      visit "/shelters/#{shelter1.id}"

      expect(page).to have_content(shelter1.name)
      expect(page).to have_content(shelter1.address)
      expect(page).to have_content(shelter1.city)
      expect(page).to have_content(shelter1.state)
      expect(page).to have_content(shelter1.zip)
  end

  it "the shelters index page has a link to create a new shelter" do 
    
      visit '/shelters'
      expect(page).to have_link('New Shelter')

      click_link 'New Shelter'
 
      expect(page).to have_content('Name :')
      expect(page).to have_content('Address :')
      expect(page).to have_content('City :')
      expect(page).to have_content('State :')
      expect(page).to have_content('Zip :')
      expect(page).to have_button('Create Shelter')

      fill_in 'name', with: 'Puppies on Fire'
      fill_in 'address', with: '1042 Leona Street'
      fill_in 'city', with: 'Aurora'
      fill_in 'state', with: 'CO'
      fill_in 'zip', with: '02301'
      click_button 'Create Shelter'

      expect(page).to have_current_path('/shelters')
      expect(page).to have_content('Puppies on Fire')
  end

  it "the shelter show page displays an update shelter link to update the specific shelter information" do 

    info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => "02300"} 
    shelter1 = Shelter.create!(info1)

    visit "/shelters/#{shelter1.id}"
    expect(page).to have_link('Update Shelter')

    click_link 'Update Shelter'

    expect(page).to have_current_path("/shelters/#{shelter1.id}/edit")
    expect(page).to have_content('Name:')
    expect(page).to have_content('Address:')
    expect(page).to have_content('City:')
    expect(page).to have_content('State:')
    expect(page).to have_content('Zip:')

    fill_in 'name', with: 'Puppies on Fire'
    fill_in 'address', with: '1042 Leona Street'
    fill_in 'city', with: 'Aurora'
    fill_in 'state', with: 'CO'
    fill_in 'zip', with: '02301'
    click_button 'Update Shelter'

    expect(page).to have_current_path("/shelters/#{shelter1.id}")
    expect(page).to have_content('Puppies on Fire')
    expect(page).to have_content('1042 Leona Street')
    expect(page).to have_content('Aurora')
    expect(page).to have_content('CO')
    expect(page).to have_content('02301')

  end

  it "the shelter show page displays a delete shelter link to delete the specific shelter" do 

    info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
    shelter1 = Shelter.create!(info1)
    info2 = {:name => 'Cuttest Puppy Rescue', :address => '729th E 10th Avenue' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
    shelter2 = Shelter.create!(info2)
    
    visit "/shelters/#{shelter1.id}"

    expect(page).to have_link('Delete Shelter')

    click_link 'Delete Shelter'

    expect(page).to have_current_path("/shelters")
    expect(page).to have_content('Cuttest Puppy Rescue')
    expect(page).to_not have_content('Rocky Mountain Puppy Rescue')

  end

  it "the shelter pets index page has a link to create a new adoptable pet" do 

    info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
    shelter1 = Shelter.create!(info1)

    pet1_info = {:name => 'Rusky', :age => 4 , :sex => 'M' , :shelter => shelter1, :image => 'skhf.img', :status => 'pending', :description => 'horrible'}
    pet1 = Pet.create!(pet1_info)
    pet2_info = {:name => 'Silly', :age => 9 , :sex => 'M' , :shelter => shelter1, :image => 'skasdhf.img', :status => 'pending', :description => 'on fire'}
    pet2 = Pet.create!(pet2_info)
   
    visit "/shelters/#{shelter1.id}/pets"
    expect(page).to have_link('Create Pet')

    click_link "Create Pet"

    expect(page).to have_current_path("/shelters/#{shelter1.id}/pets/new")
    expect(page).to have_content('Image')
    expect(page).to have_content('Name')
    expect(page).to have_content('Description')
    expect(page).to have_content('Age')
    expect(page).to have_content('Sex')

    expect(page).to have_button("Create Pet")

    fill_in 'name', with: 'Noisette'
    fill_in 'description', with: 'annoying'
    fill_in 'age', with: '17'
    fill_in 'sex', with: 'female'
    fill_in 'image', with: 'a_cute_puppy_image_here'
    click_button 'Create Pet'
      
    expect(page).to have_current_path("/shelters/#{shelter1.id}/pets")
    expect(page).to have_content('Noisette')
    expect(page).to have_content('17')
    expect(page).to have_content('F')
    expect(page).to have_content('annoying')
    expect(page).to have_css("img[src*='a_cute_puppy_image_here']")
  end

  it "the shelter index page has an edit button next to each shelter" do 

    info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
    shelter1 = Shelter.create!(info1)
    info2 = {:name => 'Cuttest Puppy Rescue', :address => '729th E 10th Avenue' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
    shelter2 = Shelter.create!(info2)

    visit "/shelters"

    within("div#shelter_#{shelter1.id}") do
      click_link "Edit"
    end

    expect(page).to have_current_path("/shelters/#{shelter1.id}/edit")

    expect(page).to have_content('Name:')
    expect(page).to have_content('Address:')
    expect(page).to have_content('City:')
    expect(page).to have_content('State:')
    expect(page).to have_content('Zip:')

    fill_in 'name', with: 'Puppies on Fire'
    fill_in 'address', with: '1042 Leona Street'
    fill_in 'city', with: 'Aurora'
    fill_in 'state', with: 'CO'
    fill_in 'zip', with: '02301'
    click_button 'Update Shelter'

    expect(page).to have_current_path("/shelters/#{shelter1.id}")

    expect(page).to have_content('Puppies on Fire')
    expect(page).to have_content('1042 Leona Street')
    expect(page).to have_content('Aurora')
    expect(page).to have_content('CO')
    expect(page).to have_content('02301')
  
  end

  it "the shelter index page has a delete button next to each shelter" do 

    info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
    shelter1 = Shelter.create!(info1)
    info2 = {:name => 'Cuttest Puppy Rescue', :address => '729th E 10th Avenue' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
    shelter2 = Shelter.create!(info2)
    info3 = {:name => 'Desperate Puppy Rescue', :address => '1931 Larimer Street' , :city => 'Denver' , :state => 'CO', :zip => '80201'} 
    shelter3 = Shelter.create!(info3)

    visit "/shelters"

    within("div#shelter_#{shelter3.id}") do
      click_link "Delete"
    end

    expect(page).to have_current_path("/shelters")

    expect(page).to_not have_content('Desperate Puppy Rescue')  
  
  end

end

