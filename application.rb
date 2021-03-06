# class Application
 
#     @@songs = [Song.new("Sorry", "Justin Bieber"),
#               Song.new("Hello","Adele")]
   
#     def call(env)
#       resp = Rack::Response.new
#       req = Rack::Request.new(env)
   
#       @@songs.each do |song|
#         resp.write "#{song.title}\n"
#       end
   
#       resp.finish
#     end
#   end

# class Application
 
#     @@songs = [Song.new("Sorry", "Justin Bieber"),
#               Song.new("Hello","Adele")]
   
#     def call(env)
#       resp = Rack::Response.new
#       req = Rack::Request.new(env)
   
#       if req.path=="/songs/Sorry"
#         resp.write @@songs[0].artist
#       elsif req.path == "/songs/Hello"
#         resp.write @@songs[1].artist
#       end
   
#       resp.finish
#     end
#   end

class Application
 
    @@songs = [Song.new("Sorry", "Justin Bieber"),
              Song.new("Hello","Adele")]
   
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path.match(/songs/)
   
        song_title = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
        song = @@songs.find{|s| s.title == song_title}
   
        resp.write song.artist
      end
   
      resp.finish
    end
  end