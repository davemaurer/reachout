module Avatarhelper
  def avatar(user)
    email_digest = Digest::MD5.hexdigest(user.email)
    avatar_url = "//www.gravatar.com/avatar/#{email_digest}"
    image_tag avatar_url
  end
end
