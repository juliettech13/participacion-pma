class RegistrationsController < Devise::RegistrationsController
  protected
  def after_sign_up_path_for(resource)
    new_legislation_consultation_path(Legislation.find(1))
  end
end
