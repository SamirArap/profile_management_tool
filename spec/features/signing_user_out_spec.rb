require 'rails_helper'

RSpec.feature "Signing out signed-in users" do
  before do
    @aki = User.create!(first_name: "Name", last_name: "Name", email: "aki@example.com", password: "password")

    visit "/"

    fill_in "Email", with: @aki.email
    fill_in "Password", with: @aki.password

    click_button "Log in"
  end

  scenario do
    click_link "Logout"

    expect(page).to have_content("Signed out successfully.")
    expect(page).not_to have_content("Logout")
    expect(current_path).to eq(root_path)

  end
end