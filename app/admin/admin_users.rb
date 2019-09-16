ActiveAdmin.register AdminUser do
  menu priority: 5
  permit_params :email, :password, :password_confirmation

  index do
    column :email
    column :sign_in_count
    column :created_at do |admin_user|
      admin_user.created_at.strftime("%d/%m/%y")
    end
    actions
  end

  filter :email
  filter :sign_in_count
  filter :created_at do |admin_user|
    admin_user.created_at.strftime("%d/%m/%y")
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    panel "Usuario" do
      table_for admin_user do
        column "Email" do |user|
          user.email
        end
      end
    end
    active_admin_comments
  end


end
