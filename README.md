<p>Title: <strong><%=@article.title %></strong></p>
<p>Description: <strong><%=@article.description %></strong></p>

<%= link_to 'Edit', edit_article_path(@article) %> |
<%= link_to 'Back to All Articles', articles_path %> </td> |
<%= link_to 'Delete', article_path(@article), data: { confirm: "Are you sure?", method: :delete} %>
