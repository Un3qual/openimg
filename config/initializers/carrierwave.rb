CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region: 'us-west-2'
  }
  config.fog_directory = ENV["AWS_S3_BUCKET"]
end
module CarrierWave
  module RMagick

    # Strips out all embedded information from the image
    def strip
      manipulate! do |img|
        img.strip!
        img = yield(img) if block_given?
        img
      end
    end
    

    # Reduces the quality of the image to the percentage given
    def quality(percentage)
      manipulate! do |img|
        img.write(current_path){ self.quality = percentage }
        img = yield(img) if block_given?
        img
      end
    end


  end

  module MiniMagick
    # Rotates the image based on the EXIF Orientation
    def exif_rotation
      manipulate! do |img|
        img.auto_orient
        img = yield(img) if block_given?
        img
      end
    end
    
    # Strips out all embedded information from the image
    def strip
      manipulate! do |img|
        img.strip
        img = yield(img) if block_given?
        img
      end
    end
    # Tiny gaussian blur to optimize the size
    def gaussian_blur(radius)
      manipulate! do |img|
        img.gaussian_blur(radius.to_s)
        img = yield(img) if block_given?
        img
      end
    end
    
    # set the Interlace of the image plane/basic
    def interlace(type)
      manipulate! do |img|
        img.interlace(type.to_s)
        img = yield(img) if block_given?
        img
      end
    end
    
    # Reduces the quality of the image to the percentage given
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end


  end
end