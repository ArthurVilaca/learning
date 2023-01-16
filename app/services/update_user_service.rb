class UpdateUserService
  def initialize(user, params)
    @user = user
    @params = params
  end

  def update_user
    raise ActionController::BadRequest.new() unless @user.exam.college_id == @params[:college_id].to_i

    @user.update!({
      first_name: @params[:first_name],
      last_name: @params[:last_name],
      phone_number: @params[:phone_number],
    })
  end
end
