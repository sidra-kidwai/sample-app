module ApplicationHelper
  def user_image resource
    image_tag(resource.avatar.url) if resource.avatar.present?
  end
end
