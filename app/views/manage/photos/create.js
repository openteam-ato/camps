<% if @photo.new_record? %>
  alert("Failed to upload gallery_file: <%= j @photo.errors.full_messages.join(', ').html_safe %>");
<% else %>
  $(".photos ul").append("<%= j render(@photo) %>");
<% end %>
