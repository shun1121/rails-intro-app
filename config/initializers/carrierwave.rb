# unless Rails.env.development? || Rails.env.test?
#     CarrierWave.configure do |config|
#       config.fog_credentials = {
#         provider: 'AWS',
#         aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
#         aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
#         region: 'ap-northeast-1'
#       }
  
#       config.fog_directory  = 'introinfo'
#       config.cache_storage = :fog
#     end
# end

CarrierWave.configure do |config|
  # S3の設定          EDITOR=vim rails credentials:editで設定したやつ
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
      :region                 => 'ap-northeast-1'
      # :host                   => '必要なら設定する'
      # :endpoint               => '必要なら設定する'
  }

  # S3のバケットを指定。
  config.fog_directory     = 'introinfo'
  # 一般公開させて無いS3の場合は以下の設定を行う。
  config.fog_public     = false
  # 一般公開されていない場合は以下の設定をする事で60秒間有効なURLを発行してくれる。
  config.fog_authenticated_url_expiration = 60
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

  # public配下にキャッシュができると参照されてしまうので、予め変えておく。
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end