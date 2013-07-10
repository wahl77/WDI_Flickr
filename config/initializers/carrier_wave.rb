CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      =>  ENV['AWS_ID'],                        # required
    :aws_secret_access_key  => ENV['AWS_SECRET'],                        # required
    :region                 => 'us-east-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'wdi-iloveyou'                     # required
  config.fog_public     = true                                   # optional, defaults to true

  if Rails.env.test?
    config.storage = :file
  else 
    config.storage = :fog 
  end  

end
