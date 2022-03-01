class CommentsController < ApplicationController
  before_action :set_request, only: %i[new create]

  def new
    @comment = @request.comments.new
  end

  def create
    @comment = @request.comments.create!(comment_params)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @request }
    end
  end

  private

  def set_request
    @request = Request.find(params[:request_id])
  end

  def comment_params
    params
      .require(:comment)
      .permit(:username, :message)
      .merge(ip_address: request.remote_ip)
  end
end
