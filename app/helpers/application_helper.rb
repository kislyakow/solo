module ApplicationHelper
	def avatar_url(comment)
		default_url = "#{root_url}public/guest.png"
    gravatar_id = Digest::MD5::hexdigest(comment.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
  end
end