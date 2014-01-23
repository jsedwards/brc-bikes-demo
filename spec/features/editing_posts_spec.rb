require 'spec_helper'

feature 'Editing Posts' do 
  before do 
    FactoryGirl.create(:post, title: 'New Bikes In Stock!')
    visit '/'
    click_link 'New Bikes In Stock!'
    click_link 'Edit Post'
  end

  scenario 'Updating a Post' do 
    fill_in 'Title', with: 'New Mountain Bikes In Stock!'
    click_button 'Update Post'

    expect(page).to have_content('Post has been updated.')
  end

  scenario "Updating a Post with invalid attributes doesn't work" do 
    fill_in "Title", with: ""
    click_button "Update Post"

    expect(page).to have_content("Post has not been updated.")
  end
end
