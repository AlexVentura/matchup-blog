class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_categories

  # Para campo fullname en users
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  # Metodos para saber que tipo de usuario es, el usuario logeado
  def authenticate_editor!
      redirect_to root_path unless user_signed_in? && current_user.is_editor?
  end

  def authenticate_admin!
      redirect_to root_path unless user_signed_in? && current_user.is_admin?
  end

  # Para permitir campo fullname en users
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :fullname
  end

  private

  # Este metodo sirve para cargar las categorias antes de cualquier accion en los artuclos
  def set_categories
      @categories = Category.all
  end

end
