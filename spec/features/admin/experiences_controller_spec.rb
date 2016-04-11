require "spec_helper"

feature "Admin - Experiences", js: true do

  before do
    country = create(:country, name: "United States")
    create(:state, name: "Vermont", country: country)
    @experience = create :experience
  end

  context "as an Admin" do

    before do
      login_user create(:admin_user)
      visit spree.admin_path
      within "ul[data-hook=admin_tabs]" do
        click_link "experiences"
      end
      page.should have_content("Listing Experiences")
    end

    scenario "should be able to create new experience" do
      click_link "New Experience"
      check "experience_active"
      fill_in "experience[name]", with: "Test Experience"
      fill_in "experience[email]", with: "spree@example.com"
      fill_in "experience[url]", with: "http://www.test.com"
      fill_in "experience[commission_flat_rate]", with: "0"
      fill_in "experience[commission_percentage]", with: "0"
      fill_in "experience[address_attributes][firstname]", with: "First"
      fill_in "experience[address_attributes][lastname]", with: "Last"
      fill_in "experience[address_attributes][address1]", with: "1 Test Drive"
      fill_in "experience[address_attributes][city]", with: "Test City"
      fill_in "experience[address_attributes][zipcode]", with: "55555"
      select2 "United States", from: "Country"
      select2 "Vermont", from: "State"
      fill_in "experience[address_attributes][phone]", with: "555-555-5555"
      click_button "Create"
      page.should have_content('Experience "Test experience" has been successfully created!')
    end

  end
end