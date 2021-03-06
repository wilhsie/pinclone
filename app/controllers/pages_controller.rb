require 'net/http'
require 'uri'

class PagesController < ApplicationController
  def home

    @earlyMornings = [{type: "soundcloud", url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/154442764&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"}]

    @mornings = [{type: "youtube", url: "https://www.youtube.com/embed/kac92T6YuP4"},
{type:"soundcloud", url:"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/106358066&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"},
{type:"soundcloud", url:"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/10706905&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"},
{type:"Soulection Phife Dawg Tribute", url:"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/256764963&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"}]

    @afternoons = [{type: "soundcloud", url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/199939454&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"},
{type: "soundcloud", url:"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/237510132&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"},
{type: "soundcloud", url:"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/174100804&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"},
{type: "soundcloud", url:"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/204841015&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"},
{type:"soundcloud", url:"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/106358066&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"},
{type:"Erykah Badu Mixtape - DJ NAIKI", url:"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/8620977&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"},
{type:"Soulection Phife Dawg Tribute", url:"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/256764963&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"}]

    @latenights = [{type: "soundcloud", url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/230226313&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"}, 
{type: "soundcloud", url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/236446111&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"},
{type:"Soulection Phife Dawg Tribute", url:"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/256764963&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"}]
    

    @quotes_array = [{quote: "You ain't gotta lie to kick it mah nigga, you ain't gotta try so hard.", artist: "Kendrick Lamar"},
    {quote: "Stay fluid, even in stacatto", artist: "Mos Def"},
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
    {quote: "I'm mad.  But I ain't stressin'.", artist:"Kendrick Lamar"},
    {quote: "Life without knowledge is death in disguise.", artist:"Talib Kweli"},
    {quote: "Don't worry, it will only slow you down.", artist:"*cawed the crow*~"},
    {quote: "Man cannot change without suffering, for he is both the marble and the sculptor.", artist:""}]

    @quotes_array_index = Random.new_seed % @quotes_array.length

    if cookies[:lat_lng] != nil
      @lat_lng = cookies[:lat_lng].split("|") 

      # Convert lat and long to city/state/country
      api_key = "5dfa9bac37cdbde1"    


      response = Net::HTTP.get_response(URI("http://api.wunderground.com/api/" + api_key + "/conditions/forecast/q/" + @lat_lng.join(",") + ".json"))    
      resbody = JSON.load(response.body)

      @location = resbody['current_observation']['display_location']['city']
      @temp_f = resbody['current_observation']['temperature_string']
      @local_time = resbody['current_observation']['local_time_rfc822'][17..18].to_f
      @local_date = resbody['current_observation']['local_time_rfc822'][0..16]
      @weather = resbody['current_observation']['weather']

      puts case @local_time
      when 0..6
        @greeting = "Early Morning Selections"
        @linkToVideo = @earlyMornings[Random.new_seed % @earlyMornings.length][:url]
      when 7..11
        @greeting = "Good Morning"
        @linkToVideo = @mornings[Random.new_seed % @mornings.length][:url]
      when 12..17
        @greeting = "こんいちは"
        @linkToVideo = @afternoons[Random.new_seed % @afternoons.length][:url]
      when 18..24 
        @greeting = "こんばんは"
        @linkToVideo = @latenights[Random.new_seed % @latenights.length][:url] 
      else
        "Error: Switch case local_time"
      end

    end

  end

  def about
  end
end
