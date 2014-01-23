require 'spec_helper'

feature 'Creating Posts' do 
  scenario 'can create a post' do 
    visit '/'
    click_link 'New Post'

    fill_in 'Title', with: 'New Bikes Available'
    fill_in 'Description', with: 'they roll on two wheels'
    click_button 'Create Post'

    expect(page).to have_content('Post has been created')
  end
end
