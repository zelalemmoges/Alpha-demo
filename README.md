# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* <%= form_with model: @article, local: true, data:   {turbo: false} do |form| %>
* ...


<table>
    <thead>
        <tr>
        <th>Title</th>
        <th>Description</th>
        <th colspan = "3"> Actions</th>
        </tr>
    </thead>
    
    <tbody>
        <% @articles.each do |article| %>
        <tr>
            <td><%= article.title %></td>
            <td><%= article.description %></td>
            <%# this will lead to that specific route (the belows also) %>
            <td><%= link_to 'Show' , article_path(article.id) %></td> 
            <td><%= link_to 'Edit' , edit_article_path(article.id) %></td>
            <td><%= link_to 'Delete', article_path(article.id), method: :delete, data: { turbo: false, confirm: "Are you sure?" } %> </td>

            
        </tr>
        <% end %>
         <%# the below three don't need id %>
        <%# this will lead to the new article page %>
        <tr>
            <td colspan="3">
                <%= link_to 'Create New Article', new_article_path %>
            </td>
        </tr>
   
    </tbody>

</table>
