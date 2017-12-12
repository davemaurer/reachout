module ReachHelper
  def avatar(user)
    email_digest = Digest::MD5.hexdigest(user.email)
    avatar_url = "//www.gravatar.com/avatar/#{email_digest}"
    image_tag avatar_url
  end

  def like_button(reach)
    if current_user.liked?(reach)
      link_to "Unlike", unlike_reach_path(reach), method: :delete
    else
      link_to "Like", like_reach_path(reach), method: :post
    end
  end
end
