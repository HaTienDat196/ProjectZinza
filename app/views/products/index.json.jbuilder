json.array! @products, partial: 'products/product', as: :product
<%= search_form_for @q do |f| %>
  <%= f.text_field :name_cont %>
  <%= f.label :articles_title_start %>
  <%= f.text_field :articles_title_start %>

  # Tìm kiếm theo nhiều attr cho 1 giá trị ...
  <%= f.label :name_or_description_or_email_or_articles_title_cont %>
  <%= f.submit %>
<% end %>
