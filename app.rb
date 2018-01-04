require 'octokit'
require 'sinatra'

module GithubController

  def self.client
    user_token = File.read("tkn.txt")
    # current_user acces token
    @client = Octokit::Client.new(:access_token => user_token)
  end

  def self.current_user # here will be sessions i suppose User.find.session:user_id?
    @current_user = client.user
  end

  def self.repos
    @repos = client.repos
  end

  def self.user_sign_in?
    true if @current_user
  end

  def self.correct_user?
    # @user = User.find(params[:id])
    unless current_user == @user
      redirect_to '/', :alert => 'Incorrect user'
    end
  end

  def self.authenticate!
    unless @current_user
      redirect_to '/', :alert => 'You need to sign in'
    end
  end

end

# somehow make oauth and chek sign_in? correct_user? authent!

get '/' do
  @current_user = GithubController.current_user
  @repositories = GithubController.repos
  @title = "Should I stay or should I go?"
  erb :index
end