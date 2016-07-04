class Playlist < ActiveRecord::Base
  serialize :songs
end
