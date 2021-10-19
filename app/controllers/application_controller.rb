class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
  #同じ遷移先だからエラーが出なかった
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path
    when Customer
      root_path
    end
  end

  # resource_or_scopeは引数で指定　複数のモデルに対応する書き方
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    elsif resource_or_scope == :customer
      root_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email ])
  end
end
