require 'spec_helper'

feature 'Deleting Posts' do 
  scenario "deleting a post" do 
    FactoryGirl.create(:post, title: "New Bike Sale!")
    visit '/'
    click_link "New Bike Sale!"
    click_link "Delete Post"
    expect(page).to have_content("Post has been deleted.")

    visit '/'
    expect(page).to have_no_content("New Bike Sale!")
  end
end
