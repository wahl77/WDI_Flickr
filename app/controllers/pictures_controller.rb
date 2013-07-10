class PicturesController < ApplicationController

  def new
  end
  def create
    album = Album.find(params[:album_id])
    album.pictures << Picture.create(params[:picture])
    redirect_to album_path(album.id)
  end

  def edit
  end

  def destroy
    album = Album.find(params[:album_id])
    picture = Picture.find(params[:id])
    picture.destroy
    redirect_to album_path(album.id)
  end

  def update
  end

end
