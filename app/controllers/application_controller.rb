class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search_q

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :last_name_kana, :first_name, :first_name_kana, :address, :postal_code, :phone_number, :is_deleted])
  end

  def search_q
    unless admin_signed_in?
      @q = Item.ransack(params[:q])
    end
  end

end
