require 'spec_helper'

feature "Editing Photos" do 
    let!(:post) { FactoryGirl.create(:post) }
    let!(:photo) { FactoryGirl.create(:photo, post: post) }
  
  before do
    visit '/'
    click_link post.title
    click_link photo.title
    click_link "Edit Photo"
  end

  scenario "Updating a photo" do 
    fill_in "Title", with: "super cool bikes"
    click_button "Update Photo"

    expect(page).to have_content("Photo has been updated.")

    within("#photo h2") do 
      expect(page).to have_content("super cool bikes")
    end

    expect(page).to_not have_content(photo.title)
  end

  scenario "Updating a photo with invalid information" do 
    fill_in "Title", with: ""
    click_button "Update Photo"

    expect(page).to have_content("Photo has not been updated.")
  end
end
