require 'digest'

module UsersHelper
  def get_gravatar(user)
    email_hash = Digest::MD5.hexdigest(user.email)
    "<img src='http://www.gravatar.com/avatar/#{email_hash}' />"
  end
end
