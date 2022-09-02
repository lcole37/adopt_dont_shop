require 'rails_helper'

RSpec.describe 'application creation' do
  describe 'the application new' do
    it "renders the new form" do
      visit '/applications/new'

      expect(page).to have_content("New Application")
      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('Street Address')
      expect(find('form')).to have_content('City')
      expect(find('form')).to have_content('State')
      expect(find('form')).to have_content('Zip Code')
      expect(page).to have_button("Submit Application")
    end
  end

  describe 'the application create' do
    context 'given valid data' do
      it 'creates the application' do
        visit '/application/new'

        fill_in 'First Name Name', with: 'Linda'
        fill_in 'Last Name', with: 'Smith'
        fill_in 'Street Adddress', with: 'Smith'
        fill_in 'City', with: 'Columbus'
        fill_in 'Zip Code', with: '39053'
        click_button 'Sumbit Application'


        # Then I am taken to the new application's show page
        expect(page).to have_current_path('/applications/#????')
        expect(page).to have_content('Linda')
        expect(page).not_to have_content('Sherry')
      end
    end
  end
end
    # As a visitor
    # When I visit the pet index page
    # Then I see a link to "Start an Application"
    # When I click this link
    # Then I am taken to the new application page where I see a form
    # When I fill in this form with my:
    #
    # Name
    # Street Address
    # City
    # State
    # Zip Code
    # And I click submit
    # Then I am taken to the new application's show page
    # And I see my Name, address information, and description of why I would make a good home
    # And I see an indicator that this application is "In Progress"
