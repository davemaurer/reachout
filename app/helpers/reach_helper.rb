module ReachHelper
  def gravatar(user)
    image_tag "//www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}"
  end
end
