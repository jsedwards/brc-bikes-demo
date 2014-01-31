require 'spec_helper'

describe PostsController do 
  let(:user) {FactoryGirl.create(:user)}
  context "standard users" do 
    { new: :get, create: :post, edit: :get, update: :put, destroy: :delete}.each do |action, method|
    it "cannot access the #{action} action" do 
      sign_in(user)
      send(method, action, :id => FactoryGirl.create(:post))

      expect(response).to redirect_to('/')
      expect(flash[:alert]).to eql("You must be an admin to do that.")
    end
  end
  end


  it "displays an error for a missing post" do 
    get :show, id: "not-a-post"
    expect(response).to redirect_to(posts_path)
    message = "The post you were looking for could not be found."
    expect(flash[:alert]).to eql(message)
  end
end