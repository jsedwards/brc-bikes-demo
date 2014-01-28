require 'spec_helper'

feature "Viewing Photos" do 
  before do
    user = FactoryGirl.create(:user)
    shiny_bikes = FactoryGirl.create(:post, title: 'New Bikes', user: user)
    FactoryGirl.create(:photo, post: shiny_bikes, title: 'ohh, ahh', description: 'pretty, new bikes')
    bike_sale = FactoryGirl.create(:post, title: 'Bike Sale', user: user)
    FactoryGirl.create(:photo, post: bike_sale, title: 'lower prices', description: 'look at the good deals')

    visit '/'
  end

  scenario "Viewing photos for a given post" do 
    click_link 'New Bikes'

    expect(page).to have_content('ohh, ahh')
    expect(page).to_not have_content('lower prices')

    click_link 'ohh, ahh'
    within('#photo h2') do 
      expect(page).to have_content('ohh, ahh')
    end

    expect(page).to have_content('pretty, new bikes')
  end
end
