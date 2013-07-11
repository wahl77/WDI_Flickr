require 'spec_helper'

describe Picture do

  it "belongs to an album" do 
    album = FactoryGirl.create(:album)
    picture = Picture.create()
    album.pictures << picture
    expect(picture.album.id).to eql(album.id)
    expect(album.pictures).not_to be_empty
    expect(album.pictures).to include(picture)
  end
end
