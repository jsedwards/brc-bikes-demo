require 'spec_helper'

feature 'Deleting Posts' do 
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, title: 'New Bikes Sale!', user: user)

    before do 
      sign_in_as!(user)
      visit '/'
      click_link post.title
    end

  scenario "deleting a post" do 
 

    click_link "Delete Post"
    expect(page).to have_content("Post has been deleted.")

    visit '/'
    expect(page).to have_no_content("New Bikes Sale!")
  end
end
