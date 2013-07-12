class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create

    album = Album.create(params[:album])

    if album.save
      current_user.albums << album
      redirect_to album_path(album)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @album = Album.find(params[:id])
    if current_user.albums.includes(@album)
      @album.destroy
      redirect_to user_path(current_user), notice:"Succesffully delete the album"
    else
      redirect_to user_path(current_user), alert:"Something went wrong"
    end
  end

  def show
    @album = Album.find(params[:id])
    if !current_user.albums.include? @album
      redirect_to user_path(current_user), alert:"You do not have permission to view this album"
    end
    @pictures = @album.pictures
    @picture = Picture.new
  end

end
