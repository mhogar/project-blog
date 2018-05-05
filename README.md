# Project: Blog

Check out the working app [here](http://ryan-stamp-project-blog.herokuapp.com/)

### About the app

_Project: Blog_ is a blog style web application that allows you easily and effortlessly organize and share your projects with the community.

### How to run it yourself

- Make sure you have the right rails and ruby versions
  - Rails: 4.2.5
  - Ruby: 2.3.4
- Run `bundle install` to install the required gems
- Run `rake db:migrate` to initialize the database
  - Note: _Project: Blog_ uses Rails' default DBMS sqlite3
- Run your local server
  - The command will vary depending on your development environment (local or cloud). For local, the command ` rails server` or `rails s` should work. Consult the appropriate documentation for the correct command.

### Give credit where credit is due...

- Authentication: [Devise](https://github.com/plataformatec/devise)
- Image upload: [Carrierwave](https://github.com/carrierwaveuploader/carrierwave)
- Markdown rendering: [Redcarpet](https://github.com/vmg/redcarpet)
