require 'rails_helper'

RSpec.feature "Users signing" do
  before do
    @aki = User.create!(first_name: "Aki", last_name: "Aki", email: "aki@example.com", password: "password")
  end

  scenario "with valid" do
    visit "/"

    fill_in "Email", with: @aki.email
    fill_in "Password", with: @aki.password

    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@aki.email}")
    expect(page).to have_link("Logout")
    expect(current_path).to eq(profiles_path)

  end

  scenario "with invalid" do
    visit "/"

    fill_in "Email", with: ""
    fill_in "Password", with: ""

    click_button "Log in"

    expect(page).to have_content("Invalid Email or password.")
    expect(current_path).to eq("/login")

  end
end