require 'spec_helper'

feature "login" do 
  scenario "can view an album" do
    pic = FactoryGirl.create(:picture)
    visit album_path(pic.album.id)
    expect(page).to have_text("Delete")
    expect(page).to have_selector("img")
  end

  scenario "upload a picture" do 
    album = FactoryGirl.create(:album)
    visit album_path(album.id)
    attach_file "picture[url]", File.join(Rails.root, "public", "Test.jpg")
    click_button "Save"
    expect(page).to have_text("Delete")
    expect(page).to have_selector("img")
    expect(page).to have_css('img[src*="Test.jpg"]')
  end
end
