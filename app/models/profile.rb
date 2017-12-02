class Profile
  attr_reader :id, :avatar_url, :html_url, :location, :login

  def initialize(attributes =  {})
    @id = attributes["id"]
    @avatar_url = attributes["avatar_url"]
    @html_url = attributes["html_url"]
    @location = attributes["location"]
    @login = attributes["login"]
  end
end