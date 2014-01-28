require 'spec_helper'

feature 'Viewing Posts' do 
  scenario 'listing all posts' do 
    post = FactoryGirl.create(:post, title: 'New Bikes In Stock!')
    user = FactoryGirl.create(:user)
    post.update(user: user)
    visit '/signin'
    fill_in "Email", with: user.email 
    fill_in "Password", with: user.password 
    click_button "Sign in"

    visit '/'
    click_link 'New Bikes In Stock!'
    expect(page.current_url).to eql(post_url(post))
  end
end