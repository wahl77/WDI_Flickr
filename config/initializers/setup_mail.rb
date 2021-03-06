ActionMailer::Base.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "railscasts.com",
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: ENV['GMAIL_USER'],
    password: ENV["GMAIL_PASS"] 
}
 
if Rails.env.production? 
  ActionMailer::Base.default_url_options[:host] = "flickr-franky-wdi.herokuapp.com"
else 
  ActionMailer::Base.default_url_options[:host] = "localhost:3000"
end

ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
