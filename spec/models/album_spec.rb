require 'spec_helper'

describe Album do
  it "must have a name" do
    a = Album.new()
    expect(a.valid?).to be_false
  end
end
