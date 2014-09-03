require "rails_helper"

feature "user can vote" do

  it "upvotes on an idea if a user upvotes it" do
    user = FactoryGirl.create(:user)
    idea = FactoryGirl.create(:idea)
    sign_in_as(user)

    visit idea_path(idea)

    click_on "Upvote!"

    expect(page).to have_content(idea.title)
    within(".votes") do
      expect(page).to have_content("1")
    end
  end

  it "destroys vote if a user clicks on upvote twice" do
    user = FactoryGirl.create(:user)
    idea = FactoryGirl.create(:idea)
    sign_in_as(user)

    visit idea_path(idea)

    click_on "Upvote!"
    click_on "Upvoted"

    expect(page).to have_content(idea.title)
    within(".votes") do
      expect(page).to have_content("0")
    end
  end

  it "keeps track of multiple votes" do
    users = FactoryGirl.create_list(:user, 3)
    idea = FactoryGirl.create(:idea)

    users.each do |user|
      sign_in_as(user)
      visit idea_path(idea)
      click_on "Upvote!"
      sign_out
    end

    expect(page).to have_content(idea.title)
    within(".votes") do
      expect(page).to have_content("3")
    end

  end
end
