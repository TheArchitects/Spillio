Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    provider :facebook, "1424803487747929", "01eb2f03a96d50dd920cb8fd6a2308cd",
        :scope => 'email,user_birthday,read_stream', :display => 'popup'
  end
  if Rails.env.production?
  	provider :facebook, "571524266252772", "395b853d3d95a2e65540ece5babb04a2",
        :scope => 'email,user_birthday,read_stream', :display => 'popup'
  end
end

OmniAuth.config.on_failure = Proc.new do |env| new_path = "/auth/failure"
 [302, {'Location' => new_path, 'Content-Type'=> 'text/html'}, []]
end