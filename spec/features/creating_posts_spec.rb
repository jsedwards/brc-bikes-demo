require 'spec_helper'

feature 'Creating Posts' do 
  before do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'New Post'
    message = "You need to sign in or sign up before continuing."
    expect(page).to have_content(message)

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end

  scenario 'can create a post' do 
    visit '/'
    click_link 'New Post'
    fill_in 'Title', with: 'New Bikes Available'
    fill_in 'Description', with: 'they roll on two wheels'
    click_button 'Create Post'

    expect(page).to have_content('Post has been created')
    within "#post #author" do 
      expect(page).to have_content("Posted by Jeff")
    end
  end

  scenario 'can not create a post without a title' do 
    visit '/'
    click_link 'New Post'
    click_button 'Create Post'
    expect(page).to have_content('Post has not been created')
    expect(page).to have_content("Title can't be blank")
  end

end
