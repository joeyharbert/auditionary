
require 'carrierwave/orm/activerecord'
p ENV["aws_access_key_id"]
p ENV["aws_secret_access_key"]

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV["aws_access_key_id"],                        # required
    aws_secret_access_key: ENV["aws_secret_access_key"],                        # required
    region:                'us-east-2', 
  }
  config.fog_directory  = 'jah-auditionary'            # required
  config.storage = :fog
  config.fog_public     = false                                                 # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end