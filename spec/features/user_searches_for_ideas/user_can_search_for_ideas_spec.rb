require "rails_helper"

feature "user can search for idea" do

  it "searches for idea name when user types in title" do
    ideas_in_search = []
    ["foo", "fool", "foolish"].each do |title|
      ideas_in_search << FactoryGirl.create(:idea, title: title)
    end

    ideas_not_in_search = FactoryGirl.create_list(:idea, 10)

    visit root_path

    fill_in "Search", with: "Foo"
    click_on "Search"

    ideas_in_search.each do |idea|
      expect(page).to have_content(idea.title)
    end
    ideas_not_in_search.each do |idea|
      expect(page).to_not have_content(idea.title)
    end
  end


end
