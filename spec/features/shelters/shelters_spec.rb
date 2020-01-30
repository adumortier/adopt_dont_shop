require 'rails_helper'

RSpec.describe 'shelters related pages', type: :feature do

  it 'the shelters index page shows a list of all the shelters' do 
    
      info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80203'} 
      shelter1 = Shelter.create(info1)
      info2 = {:name => 'Cuttest Puppy Rescue', :address => '729th E 10th Avenue' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
      shelter2 = Shelter.create(info2)
      info3 = {:name => 'Desperate Puppy Rescue', :address => '1931 Larimer Street' , :city => 'Denver' , :state => 'CO', :zip => '80201'} 
      shelter3 = Shelter.create(info3)
      visit "/shelters"

      expect(page).to have_content(shelter1.name)
      expect(page).to have_content(shelter2.name)
      expect(page).to have_content(shelter3.name)
  end

  it "the shelter show page displays the name, address, city and state of the selected shelter" do 
      info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO', :zip => '80203'} 
      shelter1 = Shelter.create(info1)
    
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
    info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO'} 
    shelter1 = Shelter.create(info1)
      
    
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
    click_button 'Submit'

    expect(page).to have_current_path("/shelters/#{shelter1.id}")

    expect(page).to have_content('Puppies on Fire')
    expect(page).to have_content('1042 Leona Street')
    expect(page).to have_content('Aurora')
    expect(page).to have_content('CO')
    expect(page).to have_content('02301')

  end

  it "the shelter show page displays a delete shelter link to delete the specific shelter" do 
    info1 = {:name => 'Rocky Mountain Puppy Rescue', :address => '11 Market Street' , :city => 'Denver' , :state => 'CO'} 
    shelter1 = Shelter.create(info1)
    info2 = {:name => 'Cuttest Puppy Rescue', :address => '729th E 10th Avenue' , :city => 'Denver' , :state => 'CO', :zip => '80202'} 
    shelter2 = Shelter.create(info2)
    info3 = {:name => 'Desperate Puppy Rescue', :address => '1931 Larimer Street' , :city => 'Denver' , :state => 'CO', :zip => '80201'} 
    shelter3 = Shelter.create(info3)    
    visit "/shelters/#{shelter1.id}"
    expect(page).to have_link('Delete Shelter')
    click_link 'Delete Shelter'
    expect(page).to have_current_path("/shelters/")
    expect(page).to_not have_content('Rocky Mountain Puppy Rescue')
  end


end

