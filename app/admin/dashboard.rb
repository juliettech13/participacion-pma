ActiveAdmin.register_page "Dashboard" do
  menu false

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

 content title: proc{ I18n.t("active_admin.dashboard") } do
   # div class: "blank_slate_container", id: "dashboard_default_message" do
   #   span class: "blank_slate" do
   #     span I18n.t("active_admin.dashboard_welcome.welcome")
   #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
   #   end
   # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # Failed try....
    # columns do
    #   column do
    #     panel "Recent Answers" do
    #       ul do
    #         Answer.recent(5).map do |post|
    #           li link_to(answer.content, admin_admin_answers_path)
    #         end
    #       end
    #     end
    #   end

    # Examples of how to do it...
    columns do
      column do
        panel "Respuestas Recientes" do
          ul do
            Answer.last(10).map do |answer|
              li do
                link_to admin_answer_path(answer) do
                  "#{answer.question.content} -> #{answer.content}"
                end
                # link_to(answer.content, admin_answer_path(answer))
              end
            end
          end
        end
      end
    end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
