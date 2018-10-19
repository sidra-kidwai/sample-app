class AttachmentsController < ApplicationController
  
  def new
  end

  def create
  end

  def show
  end

private
  def attachment_params
    params.require(:attachment).permit(:file, :attachable_type, :attachable_id)
  end
end
