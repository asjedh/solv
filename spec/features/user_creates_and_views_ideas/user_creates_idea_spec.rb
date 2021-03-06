require 'rails_helper'

feature "user can add idea" do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
  end

  it "creates new idea if user inputs idea correctly" do
    user = FactoryGirl.create(:user)
    idea = FactoryGirl.build(:idea, user: user)
    sign_in_as(user)

    visit root_path
    click_on "New Idea"

    fill_in "Title", with: idea.title
    fill_in "Abstract", with: idea.abstract
    fill_in "Body", with: idea.body
    page.check("Technology")
    click_on "Create Idea"

    idea = Idea.first
    expect(page).to have_content("Your idea has been added!")
    expect(page).to have_content(idea.title)
    expect(page).to have_content(idea.abstract)
    expect(page).to have_content(idea.body)
    idea.categories.each do |category|
      expect(page).to have_content(category.name)
    end
  end

   it "does not create new idea if user inputs idea incorrectly" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_idea_path

    click_on "Create Idea"

    count = page.body.scan("can't be blank").count
    expect(count).to equal(3)
  end

   it "does not allow user to visit new idea page if not logged in" do
    visit new_idea_path
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

end
