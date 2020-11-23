class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    #データベースに名前を保存するために以下を追記する
    # ここから追加します
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
    end
    # ここまで追加します
  end