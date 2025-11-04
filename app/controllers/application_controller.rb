class ApplicationController < ActionController::Base
  # Devise コントローラーを使うときだけ呼ばれる
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # サインアップ・アカウント更新時に追加カラムを許可
  def configure_permitted_parameters
    # 新規登録時に許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])

    # 会員情報編集時に許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :occupation, :position])
  end
end