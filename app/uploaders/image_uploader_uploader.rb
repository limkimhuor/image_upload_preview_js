class ImageUploaderUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb, if: :image? do
    process resize_to_fill: [Settings.images.resize_width, Settings.images.resize_height]
  end

  def content_type_whitelist
    %w(image/jpeg image/png image/gif)
  end

  protected
  def image? file
    file.content_type.include? "image"
  end

end
