require 'net/http'
require 'net/http'
require 'uri'

class PagesController < ApplicationController
  def home
    @url_array = [{type: "youtube", url: "https://www.youtube.com/embed/65Yzwp__Axk"},
    {type: "youtube", url: "https://www.youtube.com/embed/kac92T6YuP4"},
    {type: "youtube", url: "https://www.youtube.com/embed/P3-QkCzAv7M"},
    {type: "youtube", url: "https://www.youtube.com/embed/HxNTDNJ7Ndo"},
    {type: "youtube", url: "https://www.youtube.com/embed/yPVhFqZgP4U"},
    {type: "soundcloud", url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/154442764&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"},
    {type: "soundcloud", url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/199939454&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"},
    {type: "soundcloud", url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/236446111&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"}]

    @quotes_array = [{quote: "Stay fluid, even in stacatto", artist: "Mos Def"},
    {quote: "When I let go of what I am, I become what I might be.", artist: ""},
    {quote: "Being deeply loved by someone gives you strength, while loving someone deeply gives you courage.", artist: ""},
    {quote: "A journey of a thousand miles must begin with a single step.", artist:""},
    {quote: "If you do not change direction, you may end up where you are heading.", artist:""},
    {quote: "Be content with what you have; rejoice in the way things are. When you realize there is nothing lacking, the whole world belongs to you.", artist:""},
    {quote: "Nature does not hurry, yet everything is accomplished.", artist:""},
    {quote: "A good traveler has no fixed plans, and is not intent on arriving.", artist:""},
    {quote: "She who controls others may be powerful, but she who has mastered herself is mightier still.", artist:""},
    {quote: "Simplicity is ultimate sophistication", artist:""},
    {quote: "Freedom is the ability to not do what you should not do", artist:"Immanuel Kan"},
    {quote: "I'm mad.  But I ain't stressin'.", artist:"Kendrick Lamar"}]

    @quotes_array_index = Random.new_seed % @quotes_array.length

    @lat_lng = cookies[:lat_lng].split("|") 
 
    # Convert lat and long to city/state/country
     
    @response = Net::HTTP.get_response(URI("http://dev.virtualearth.net/REST/v1/Locations/" + @lat_lng.join(",") + "?includeEntityTypes=Neighborhood,CountryRegion&key=AmINVxcc_sPcCBx1CR652dkjpSLasZjfEtlmmeFmlyh9YYX9VKDYNDLEat9y1XUK"))
   
    @resbody = JSON.parse(@response.body)

    #client = Weatherman::Client.new
       
  end

  def about
  end
end
