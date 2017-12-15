module ReachHelper
  def reach_form_for(content_type)
    form_for Reach.new do |form|
      form.hidden_field(:content_type, value: content_type) +
      form.fields_for(:content) { |content_form| yield(content_form) } +
      form.submit("Reach Out!")
    end
  end

  def like_button(reach)
    if current_user.liked?(reach)
      link_to "Unlike", unlike_reach_path(reach), method: :delete
    else
      link_to "Like", like_reach_path(reach), method: :post
    end
  end

  def autolink(text)
    text.gsub(/@\w+/) { |mention| link_to mention, user_path(mention[1..-1]) }.html_safe
  end
end
