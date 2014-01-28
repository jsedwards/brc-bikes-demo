require 'spec_helper'

feature "Deleting Photos" do 
  let!(:user) { FactoryGirl.create(:user) }
  let!(:post) do
    post =  FactoryGirl.create(:post) 
    post.update(user: user)
    post
  end
  let!(:photo) { FactoryGirl.create(:photo, post: post) }

  before do 
    visit '/'
    click_link post.title
    click_link photo.title
  end

  scenario "Deleting a Photo" do 
    click_link "Delete Photo"

    expect(page).to have_content("Photo has been deleted.")
    expect(page.current_url).to eq(post_url(post))
  end
end