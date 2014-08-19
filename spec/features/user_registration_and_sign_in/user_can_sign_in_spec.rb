require 'rails_helper'

feature "user can sign in" do

  it "signs a user in if information inputted correctly" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_on "Sign in"

    expect(page).to have_content "Logout"
    expect(page).to have_content "Signed in successfully."
  end

  it "does not sign user in if no info is inputted" do
    visit new_user_session_path
    click_on "Sign in"

    expect(page).to have_content("Invalid email or password")
  end
end
