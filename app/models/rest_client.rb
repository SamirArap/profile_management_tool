class RestClient
  include HTTParty

  def get_user(login)
    @github_user = []
    url = 'https://api.github.com'
    response = HTTParty.get(url + "/users/#{login}")
    @github_user << Profile.new(response)

    @github_user
  end


  def get_repos(login)
    @github_user_reposes = []
    url = 'https://api.github.com'
    response = HTTParty.get(url + "/users/#{login}/repos")

    response.parsed_response.each do |parsed_response|
      @github_user_reposes << Repo.new(parsed_response)
    end

    @github_user_reposes
  end

end