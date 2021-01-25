class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song = filename.split(" - ")
        song_new = self.new(song[1])
        song_new.artist_name=(song[0])
        song_new
    end

    def artist_name=(name)
        Artist.find_or_create_by_name(name).add_song(self)
    end
end