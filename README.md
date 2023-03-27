<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Description</th>
      <th colspan= "<%=@callspan_action_table%>" >Action</th>
    </tr>
  </thead>
  <tbody>
    <% @articles.each do |articleInstance| %>
      <tr> 
        <td> <%= articleInstance.title %> </td>
        <td> <%= articleInstance.description %> </td>
        <td> <%= link_to 'Show', article_path(articleInstance)%> </td>
        <td> <%= link_to 'Edit', edit_article_path(articleInstance) %> </td>
        <td> <%= link_to 'Delete', article_path(articleInstance), data: {confirm: "Are you sure?", method: :delete} %> </td>
      </tr>
    <% end %>
  </tbody>
</table>

<p><%= link_to 'Create A New Article', new_article_path %> </p>
