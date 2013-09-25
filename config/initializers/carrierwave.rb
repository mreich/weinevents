CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/"
  config.storage = :fog
  config.permissions = 0666
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIDOQDUMD33UEK2XA',
    :aws_secret_access_key  => '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',
  }
  config.fog_directory  = 'weinevents'
end