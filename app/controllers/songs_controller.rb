class SongsController < ApplicationController

    before_action :find_song, only:[:show, :edit, :update]

    def index
        @songs = Song.all
    end
    
    def show
    end
    
    def new
        @song = Song.new
    end
    
 
    def create
        @artist = find_artist
        @genre = find_genre
        @song = Song.create(name:params[:song][:name], artist_id: @artist.id, genre_id: @genre.id)
        redirect_to song_path(@song)
    end


    
    def edit
    end
    
    def update
        @artist = find_artist
        @genre = find_genre
        @song.update(name:params[:song][:name], artist_id: @artist.id, genre_id: @genre.id)
        redirect_to song_path(@song)
    end


    
    
    private
    
    def find_song
        @song = Song.find(params[:id])
    end

    def find_artist
        Artist.find_or_create_by(name:params[:song][:artist_id])
    end

    def find_genre
        Genre.find_or_create_by(name:params[:song][:genre_id])
    end
    
    def song_params(*args)
        params.require(:song).permit(*args)
    end


end
