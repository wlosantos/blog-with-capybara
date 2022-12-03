require 'rails_helper'

RSpec.describe "CreateArticles", type: :system do
  before do
    driven_by(:selenium_chrome)
  end

  scenario "user creates a new article" do
    visit "/articles/new"

    fill_in "Title", with: "Creating a blog"
    fill_in "Body", with: "Lorem ipsum"

    click_button "Create Article"

    expect(page).to have_content("Article was successfully created")
    expect(page.current_path).to eq(articles_path)
  end
end
