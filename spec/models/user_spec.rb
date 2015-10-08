require 'rails_helper'

RSpec.describe User, type: :model do
  def valid_attributes(new_attributes = {})
    {email_address:      "mehdi@glsys.com",
     password:   "12345"
   }.merge(new_attributes)
  end

  # describe in here starts a new section of test scenarios / examples
  describe "Validations" do
    it "requires an email" do
      user = User.new valid_attributes({email_address: nil})
      expect(user).to be_invalid
    end

    it "requires a password" do
      # Given - a new user with all valid attributes except for a missing password
      user = User.new valid_attributes({password: nil})
      # When - you try to save the user record
      user.save
      # Then - you get an attached errors that include a :password key
      # expect(user.errors.messages.has_key?(:password)).to eq(true)
      expect(user.errors.messages).to have_key(:password)
    end

    it "requires an email with a valid format" do
      user = User.new(valid_attributes({email_address: "asdfasdfasdf"}))
      expect(user).to be_invalid
    end

  end

  describe "generating password hash" do

    it "generates a password digest" do
      user = User.new(valid_attributes)
      user.save
      expect(user.password_digest).to be
    end

  end
end
