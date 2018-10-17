module PostsHelper
  def post_image resource
    image_tag(resource.picture.url, size: "100em") if resource.picture.present?
  end
end
