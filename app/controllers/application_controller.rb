class ApplicationController < ActionController::Base

    helper_method :current_user
    before_action :login_required

    private

    # ログイン後、セッション情報を管理
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    # 機能を利用する前に、ログインされているかチェックする　ログインされていなければ利用できないようにする
    def login_required
        redirect_to login_path unless current_user
    end
end
