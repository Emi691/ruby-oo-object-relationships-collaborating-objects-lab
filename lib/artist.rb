class Artist
    attr_accessor :name
    @@all

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def add_song(song)
        song.artist= self
    end

    def self.find_or_create_by_name(name)
        if @@all.find{|artist| artist.name == name} == nil
            name = self.new(name)
        else
            @@all.find{|artist| artist.name == name}  
        end
    end

    def print_songs
        song_names = self.songs.map{|song| song.name}
        song_names.each{|name| puts name} 
    end

end