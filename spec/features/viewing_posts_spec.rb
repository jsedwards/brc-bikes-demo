require 'spec_helper'

feature 'Viewing Posts' do 
  scenario 'listing all posts' do 
    post = FactoryGirl.create(:post, title: 'New Bikes In Stock!')
    visit '/'
    click_link 'New Bikes In Stock!'
    expect(page.current_url).to eql(post_url(post))
  end
end