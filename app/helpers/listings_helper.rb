module ListingsHelper
  def smart_image_tag(listing)
      return image_tag(listing.picture_url, style: "display: visible;") unless listing.picture_url.nil? || listing.picture_url.empty?
    return image_tag(listing.image) unless listing.image.blob.nil?
    "no image uploaded"
  end
end