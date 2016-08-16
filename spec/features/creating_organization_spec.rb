require "rails_helper"
RSpec.feature "User can create new Organization" do
  scenario "with valid attributes" do

    visit "/organizations"

    click_link "New Organization"
    fill_in "Name", with: FactoryGirl.create(:organization)
    fill_in "Website", with: "A text editor for everyone"
    fill_in "Contry", with: "A text editor for everyone"
    fill_in "Currency", with: "A text editor for everyone"
    fill_in "Time zone", with: "A text editor for everyone"
    fill_in "Logo", with: "A text editor for everyone"
    click_button "Create Organization"

    expect(page).to have_content "Organization was successfully created."
  end
end