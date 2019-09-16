ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

config.clear_action_items!
actions :all, except: [:edit, :update, :destroy]
menu priority: 4


index do
  column "Nombre" do |user|
    user.first_name ? user.first_name : "No dio nombre al registrarse"
  end

  column "Apellido" do |user|
    user.last_name ? user.last_name : "No dio nombre al registrarse"
  end

  column "Email" do |user|
    user.email
  end
end

show do
  panel "Usuarios" do
    table_for user do
      column "Nombre" do |user|
        user.first_name ? user.first_name : "No dio nombre al registrarse"
      end

      column "Apellido" do |user|
        user.last_name ? user.last_name : "No dio nombre al registrarse"
      end

      column "Email" do |user|
        user.email
      end
    end
  end
  active_admin_comments
end


end
