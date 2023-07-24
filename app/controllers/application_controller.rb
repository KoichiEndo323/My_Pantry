class ApplicationController < ActionController::Base
  def image_url(model)
    "https://mypantry-img-files-resize.s3-ap-northeast-1.amazonaws.com/#{model.image.key}-thumbnail.#{model.image.content_type.split('/').pop}"
  end
end
