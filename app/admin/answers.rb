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

  # filter :created_at do |answer|
  #   answer.created_at.strftime("%d/%m/%y")
  # end

  # filter :question do |answer|
  #   answer.question.content
  # end

  filter :user do |answer|
    answer.consultation.user.full_name
  end

  index do

    column "Usuarios" do |answer|
      user = answer.consultation.user
      link_to user.first_name ? user.full_name : user.email, admin_user_path(answer.consultation.user)
    end

    column "Preguntas" do |answer|
      answer.question.content
    end

    column "Respuestas" do |answer|
      answer = answer.content
      link_to answer, admin_answer_path(answer)
    end

    column "Fecha" do |general_feedback|
      general_feedback.created_at.strftime("%d/%m/%y")
    end

    actions
  end

  show do
    attributes_table do
      row :content
      row :question_id
      row :user_id
    end
    h3 "Question: #{answer.question.content}"
    h3 "Email: #{answer.consultation.user.email}"
    h3 "User Full Name: #{answer.consultation.user.full_name}"
    active_admin_comments
  end

  # show do
  #   # h3 answer.content
  #   # h6 answer.question.content
  # end

 # index do
 #   id_column
 #   column :image_title
 # end
 # config.clear_action_items!
 # actions :all, except: [:edit, :update, :destroy]
 # menu priority: 2

  filter :user_id
  filter :question_id
end
