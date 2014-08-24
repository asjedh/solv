require "rails_helper"

feature "user comments on idea" do

  it "adds valid comment to idea if user is signed in" do
    user = FactoryGirl.create(:user)
    idea = FactoryGirl.create(:idea, user: user)
    sign_in_as(user)

    visit idea_path(idea)

    fill_in "Comment", with: "Cool idea bro"
    click_on "Submit"

    expect(page).to have_content(idea.title)
    expect(page).to have_content("Cool idea bro")
  end

end
