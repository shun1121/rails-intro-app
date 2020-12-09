class IntroductionUploader < CarrierWave::Uploader::Base
  if Rails.env.development?
    # used to be storage :file
    storage :fog 
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/" #これでuploads/の直下に配置される
    # "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(png jpg)
  end

  def filename
    original_filename if original_filename
  end
end
