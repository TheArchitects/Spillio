Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1424803487747929", "01eb2f03a96d50dd920cb8fd6a2308cd",
           :scope => 'email,user_birthday,read_stream', :display => 'popup'
end

OmniAuth.config.on_failure = Proc.new do |env| new_path = "/auth/failure"
 [302, {'Location' => new_path, 'Content-Type'=> 'text/html'}, []]
end