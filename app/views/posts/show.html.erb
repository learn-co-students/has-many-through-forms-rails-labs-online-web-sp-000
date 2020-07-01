<% @post.comments.each do |comments| %>
  <%= comments.content %></br>
<% end %>

<em>Comments</em>
  <% @post.comments.each do |comment| %>
  <p><%= comment.user.username %> says: <%= comment.content %></p>
<% end %>

<h3>Add a New Comment</h3>
<%= form_for @post.comments.build do |f| %>
  <%= f.hidden_field :post_id, value: @post.id %>
  <%= f.label :content %>
  <%= f.text_field :content %><br /><br />
  <%= f.label "Username" %>
  <%= f.collection_select :user_id, User.all, :id, :username, :include_blank => true %><br /><br />
  <%= f.label "New User:" %>
  <%= f.fields_for :user, User.new do |user_fields| %>
    <%= user_fields.label :username %>
    <%= user_fields.text_field :username %>
  <% end %>
  <%= f.submit id="Create Comment" %>
<% end %>