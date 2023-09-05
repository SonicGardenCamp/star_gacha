class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session      # ログインの直前に必ずこれを書くこと
      log_in user
      redirect_to user
    else
      # エラーメッセージを作成する
      flash.now[:danger] = 'ログインに失敗しました。入力情報を確認して再度ログインしてください'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_path, status: :see_other
  end
end
