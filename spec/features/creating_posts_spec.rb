require 'spec_helper'

feature 'Creating Posts' do 
  before do
    visit '/'
    click_link 'New Post'
  end

  scenario 'can create a post' do 
    fill_in 'Title', with: 'New Bikes Available'
    fill_in 'Description', with: 'they roll on two wheels'
    click_button 'Create Post'

    expect(page).to have_content('Post has been created')
  end

  scenario 'can not create a post without a title' do 
    click_button 'Create Post'
    expect(page).to have_content('Post has not been created')
    expect(page).to have_content("Title can't be blank")
  end
end
