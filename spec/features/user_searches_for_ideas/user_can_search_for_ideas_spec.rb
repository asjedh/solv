require "rails_helper"

feature "user can search for idea" do

  it "searches for idea name when user types in keywords" do
    ideas_in_search = []

    ["foo", "fool", "foolish"].each do |title|
      ideas_in_search << FactoryGirl.create(:idea, title: title)
    end

    ideas_not_in_search = FactoryGirl.create_list(:idea, 10)

    visit root_path
    fill_in "search", with: "Foo"
    click_on "Search"

    ideas_in_search.each do |idea|
      expect(page).to have_content(idea.title)
    end

    ideas_not_in_search.each do |idea|
      expect(page).to_not have_content(idea.title)
    end
  end

  it "searches for idea body when user types in keywords" do
    ideas_in_search = []

    ["foo", "fool", "foolish"].each do |body|
      ideas_in_search << FactoryGirl.create(:idea, body: body)
    end

    ideas_not_in_search = FactoryGirl.create_list(:idea, 10)

    visit root_path
    fill_in "search", with: "Foo"
    click_on "Search"

    ideas_in_search.each do |idea|
      expect(page).to have_content(idea.title)
    end

    ideas_not_in_search.each do |idea|
      expect(page).to_not have_content(idea.title)
    end
  end

  it "searches for idea abstract when user types in keywords" do
    ideas_in_search = []

    ["foo", "fool", "foolish"].each do |abstract|
      ideas_in_search << FactoryGirl.create(:idea, abstract: abstract)
    end

    ideas_not_in_search = FactoryGirl.create_list(:idea, 10)

    visit root_path
    fill_in "search", with: "Foo"
    click_on "Search"

    ideas_in_search.each do |idea|
      expect(page).to have_content(idea.title)
    end

    ideas_not_in_search.each do |idea|
      expect(page).to_not have_content(idea.title)
    end
  end


end
