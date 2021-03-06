require 'spec_helper'

feature "Adding Photos" do 
  before do 
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:post, title: "New Bikes In Stock!", user: user)

    visit '/'
    click_link "New Bikes In Stock!"
    click_link "Add Photo"
  end

  scenario "Adding a photo" do 
    fill_in "Title", with: "New Bike"
    fill_in "Description", with: "sweet ride"
    click_button "Add Photo"

    expect(page).to have_content("Photo has been added.")
  end

  scenario "Adding a photo without valid attributes fails." do 
    click_button "Add Photo"

    expect(page).to have_content("Photo has not been added.")
    expect(page).to have_content("Title can't be blank")
  end
end
