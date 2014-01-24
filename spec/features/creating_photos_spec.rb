require 'spec_helper'

feature "Adding Photos" do 
  before do 
    FactoryGirl.create(:post, title: "New Bikes In Stock!")

    visit '/'
    click_link "New Bikes In Stock!"
    click_link "Add Photo"
  end

  scenario "Adding a photo" do 
    fill_in "Title", with: "New Bike"
    fill_in "Description", with: "sweet ride"
    click_button "Create Photo"

    expect(page).to have_content("Photo has been added.")
  end

  scenario "Adding a photo without valid attributes fails." do 
    click_button "Create Photo"

    expect(page).to have_content("Photo has not been added.")
    expect(page).to have_content("Title can't be blank")
  end
end
