ActiveAdmin.register Answer do
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
  menu priority: 3

  index do
  column :user_id
  column :question_id
  column :content
  column :created_at
 end

  filter :user_id
  filter :question_id
end
