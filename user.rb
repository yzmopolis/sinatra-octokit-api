class User < ActiveRecord::Base
  has_one :github_profile

  def create_with_omniauth(auth)
    "hello user"
  end

  def create_profile
    "github profile"
  end
end

# data mapper or active record?