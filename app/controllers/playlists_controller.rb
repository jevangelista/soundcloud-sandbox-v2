class PlaylistsController < ApplicationController
	require 'SoundCloud'

	def index
    @playlists = Playlist.all
    render :index
   end

   def create
    playlist_params = params.require(:playlist).permit('tracks','names')
    p params
    p "CREATING A playlist #{playlist_params}"
    @@playlist = Playlist.create(playlist_params)

    redirect_to "/playlists/" 

   end

   def show
      id = params[:id]
      @playlist = Playlist.find(id)

      render :show
    end

  def toArray
    
    @playlist = Playlist.find(1)
    @splittedArray = @playlist.tracks.split(",")
    #p @splittedArray
    # binding.pry
    @splittedArrayNames = @playlist.names.split(",")
    # you have two lists above (track url, name)
    # now create a list that puts the two together
    # {track_url, name}
    @splittedArray.each do |i|
      @tupleArray = {track_url:  @splittedArray.pop(), name: @splittedArrayNames.pop()}
    end
    p  @tupleArray

  end


end
