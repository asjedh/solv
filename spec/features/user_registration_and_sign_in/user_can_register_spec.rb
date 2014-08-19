require 'rails_helper'

feature "user can register" do

  it "creates a new user if information inputted correctly" do
    user = FactoryGirl.build(:user)

    visit new_user_registration_path

    fill_in "Email", with: user.email
    fill_in "Name", with: user.name
    fill_in "Password", with: user.password
    fill_in "Confirm password", with: user.password

    click_on "Sign me up!"

    expect(page).to have_content "Logout"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  it "does not create a new user if no info is inputted" do
    user = FactoryGirl.build(:user)

    visit new_user_registration_path
    click_on "Sign me up!"

    count = page.body.scan("can't be blank").count
    expect(count).to equal(3)
  end

  it "does not create a new user if password confirmation is incorrrect" do
    user = FactoryGirl.build(:user)

    visit new_user_registration_path

    fill_in "Email", with: user.email
    fill_in "Name", with: user.name
    fill_in "Password", with: user.password
    click_on "Sign me up!"

    expect(page).to have_content("doesn't match Password")
  end
end
