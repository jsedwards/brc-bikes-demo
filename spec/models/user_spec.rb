require 'spec_helper'

describe User do 
  describe "passwords" do 
    it "needs a password and confirmation to save" do 
      u = User.new(name: 'jeff')
      u.save
      expect(u).to_not be_valid

      u.password = "password"
      u.password_confirmation = ""
      u.save
      expect(u).to_not be_valid

      u.password_confirmation = "password"
      u.save
      expect(u).to be_valid
    end

    it "needs password and confirmation to match" do 
      u = User.create(name: 'jeff', password: 'secret', password_confirmation: 'secret1')
      expect(u).to_not be_valid
    end
  end

  describe "authentication" do 
    let(:user) { User.create(name: 'jeff', password: 'secret2', password_confirmation: 'secret2') }

    it "authenticates with a correct password" do 
      expect(user.authenticate('secret2')).to be 
    end

    it "does not authenticate with an incorrect password" do 
      expect(user.authenticate('secret3')).to_not be 
    end
  end
end

