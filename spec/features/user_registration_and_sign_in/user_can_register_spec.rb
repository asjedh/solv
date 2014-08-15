require "spec_helper"

feature "user can register" do

  it "creates a new user if information inputted correctly" do
    user = FactoryGirl.create(:user)

    visit new_user_registration_path

    fill_in "Email" with user.email
    fill_in "name" with user.name

  end

end
