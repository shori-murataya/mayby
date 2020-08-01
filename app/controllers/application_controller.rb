class ApplicationController < ActionController::Base
  # helper_methodとして定義するべき
  # helper_method :current_user
  before_action :current_user
  # 個別のコントローラーでskipした方が良い
  before_action :no_login_user,{only:[:index, :show, :edit]}

  # devise gemでついてくる
  def current_user
    # @current_user ||= User.find_by(id: session[:user_id])
    @current_user = User.find_by(id: session[:user_id])
  end

  # devise を使うとauthenticate_user!というメソッドがついてくるはず
  def no_login_user
    if @current_user == nil
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end

end
