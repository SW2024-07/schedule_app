class TopController < ApplicationController
  def main
    # トップページの表示処理
  end

  def login
    if request.post?
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_calendars_path, notice: "#{current_user.username}としてログインしました" # 例として表示
      else
        flash.now[:alert] = 'メールアドレスまたはパスワードが間違っています'
        render :login
      end
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path, notice: 'ログアウトしました'
  end
end
