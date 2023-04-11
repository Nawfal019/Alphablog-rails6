module ApplicationHelper

  def gravatas_for(user, options ={size:80})
      # get the email from URL-parameters or what have you and make lowercase
      email_address = user.email

      # create the md5 hash
      hash = Digest::MD5.hexdigest(email_address)
      size_pic= options[:size]
      image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{size_pic}"
      image_tag(image_src, alt: user.username, class:"rounded shadow mx-auto d-block")
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

end
