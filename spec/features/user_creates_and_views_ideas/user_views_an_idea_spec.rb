require "spec_helper"

feature "user views ideas" do

  it "shows idea page if user goes to idea/:id " do
    user = FactoryGirl.create(:user)
    idea = FactoryGirl.create(:idea)
    sign_in_as(user)

    visit idea_path(idea)

    expect(page).to have_content(idea.title)
    expect(page).to have_content(idea.abstract)
    expect(page).to have_content(idea.body)
    expect(page).to have_content(idea.created_at)
  end

end
