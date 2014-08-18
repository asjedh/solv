require "spec_helper"

feature "user can add idea" do

  it "creates new idea if user inputs idea correctly" do
    user = FactoryGirl.create(:user)
    idea = FactoryGirl.build(:idea)
    sign_in_as(user)

    visit new_idea_path

    fill_in "Title", with: idea.title
    fill_in "Abstract", with: idea.abstract
    fill_in "Body", with: idea.body

    click_on "Create Idea"

    expect(page).to have_content("Your Ideas")
    expect(page).to have_content("Idea added successfully")
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

    expect(page).to have_content("Sign in")
    expect(page).to have_content("You need to be logged in to do that.")
  end

end
