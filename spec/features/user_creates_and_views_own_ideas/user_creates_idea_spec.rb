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

end
