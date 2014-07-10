module Helpers

  def authenticate
    Teamwork.authenticate(ENV["API_KEY"])
  end

end