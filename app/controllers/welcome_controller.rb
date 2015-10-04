class WelcomeController < ApplicationController
	require 'SoundCloud'

	def index
		track_arr = []
		names_arr = []
		client = SoundCloud.new(client_id: 'b61acae9ab94159d1de902fdee787599')
		tracks = client.get('/tracks?', :limit => 15, :genres => 'indie')
		puts tracks[1]
		tracks.each do |track|
			puts track.streamable
			if track.streamable 
				url = track.uri.to_s + "/stream?client_id=b61acae9ab94159d1de902fdee787599"	
				track_arr << url
				names_arr << track.title
			end
		end
		@tracks = track_arr
		@names = names_arr
	end
end
