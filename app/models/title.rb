class Title < ApplicationRecord
  has_many :chapters
  belongs_to :legislation
  has_many :articles, through: :chapters

  def capitalized_title
    self.description.split.map do |word|
      if word == 'Y'
        word = 'y'
      else
        word.capitalize
      end
    end.join(" ")
  end
end


# <div class="header-article">
#   <div class="d-flex flex-row">
#   <% if article.new == true %>
#     <h6 class="align-left p-2">Artículo</h6>
#     <div class="p-2 badge badge-warning">Nuevo</div>
#   <% else %>
#     <h6 class="align-left p-2">Artículo <%= article.number %></h6>
#     <% if Metadatum.exists?(article: article) %>
#       <% @metadata = Metadatum.find_by(article: article) %>
#       <a data-html="true" data-toggle="popover" data-trigger="hover" title="Artículo Modificado" data-content="<%= render 'metadata_show', metadata: @metadata %>" class="p-2 badge badge-warning">Modificación</a>
#     <% end %>
#   <% end %>
#  </div>
