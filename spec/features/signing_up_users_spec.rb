require 'rails_helper'

RSpec.feature "Sigup users" do
  scenario "with valid credentials" do
    visit "/"

    click_link "Sign up"

    fill_in "First name", with: "Name"
    fill_in "Last name", with: "Name"
    fill_in "Email", with: "user@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Create an account"

    expect(page).to have_content("You have signed up successfully.")
  end

  scenario "with invalid credentials" do
    visit "/"

    click_link "Sign up"

    fill_in "First name", with: ""
    fill_in "Last name", with: ""
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""

    click_button "Create an account"

    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
  end
end