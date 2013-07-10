class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @album = Album.find(params[:id])
    @pictures = @album.pictures
    @picture = Picture.new
  end

  def index
  end

end
