require "rails_helper"
RSpec.feature "Users can create new tickets" do
  before do
    project = FactoryGirl.create(:organization, name: "Internet Explorer")
    visit organization_path(project)
    click_link "New Invoice"
  end
  scenario "with valid attributes" do
    fill_in "Customer", with: "Non-standards compliance"
    fill_in "Number", with: "My pages are ugly!"
    fill_in "Order number", with: "My pages are ugly!"
    fill_in "Salesperson", with: "My pages are ugly!"
    fill_in "Terms", with: "My pages are ugly!"
    click_button "Create Invoice"
    expect(page).to have_content "Invoice has been created."
  end
  # scenario "when providing invalid attributes" do
  #   click_button "Create Ticket"
  #   expect(page).to have_content "Ticket has not been created."
  #   expect(page).to have_content "Name can't be blank"
  #   expect(page).to have_content "Description can't be blank"
  # end
end