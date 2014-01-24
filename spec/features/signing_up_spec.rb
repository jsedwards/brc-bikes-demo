require 'spec_helper'

feature "Signing Up" do 
  scenario "Successful sign up" do 
    visit '/'
    click_link 'Sign up'
    fill_in "Name", with: "Jeff"
    fill_in "Email", with: "jeff@example.com"
    fill_in "Password", with: "secret"
    fill_in "Password confirmation", with: "secret"
    click_button "Sign Up"
    expect(page).to have_content("You have signed up successfully")
  end
end
