require 'rails_helper'

feature "user views ideas" do

  it "shows idea page if user goes to idea/:id " do
    user = FactoryGirl.create(:user)
    idea = FactoryGirl.create(:idea)
    sign_in_as(user)

    visit idea_path(idea)

    save_and_open_page
    expect(page).to have_content(idea.title)
    expect(page).to have_content(idea.abstract)
    expect(page).to have_content(idea.body)
    expect(page).to have_content(idea.created_at.to_s(:long))
    expect(page).to have_content(idea.updated_at.to_s(:long))
  end

  it "shows user's ideas if user clicks on Your Ideas " do
    user = FactoryGirl.create(:user)
    ideas = FactoryGirl.create_list(:idea, 10, user: user)
    sign_in_as(user)

    visit root_path
    click_on "Your Ideas"

    ideas.each do |idea|
      expect(page).to have_content(idea.title)
      expect(page).to have_content(idea.abstract)
    end
  end
end
