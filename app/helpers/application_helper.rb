module ApplicationHelper
 def attachment_image_tag attach
      image_tag(attach.file.url, size: "100em") if attach.present?
  end
end
