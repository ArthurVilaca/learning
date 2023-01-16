class UsersController < ApplicationController
  before_action :validate_user, :validate_exam_time_window

  # I forgot to create the project with --api
  skip_before_action :verify_authenticity_token

  def create
    UpdateUserService.new(@user, allow_params).update_user
    render status: 200, json: {}
  rescue ArgumentError
    render status: 400, json: {}
  end

  protected

  def validate_user
    @user = User.find_or_initialize_by(exam_id: params[:exam_id])
  end

  def validate_exam_time_window
    raise ActionController::BadRequest.new() unless ExamWindow.where("exam_id = ? AND start_time <= ? AND end_time >= ?", allow_params[:exam_id], allow_params[:start_time], allow_params[:start_time]).any?
  end

  def allow_params
    params.permit(
      :first_name,
      :last_name,
      :phone_number,
      :college_id,
      :exam_id,
      :start_time
    )
  end
end
