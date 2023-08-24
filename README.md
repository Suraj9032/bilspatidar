# simple-rails-rest-api

A simple rails API practiced creating API itself, authentication with JWT token, and authorization with Pundit.

- All users must log in and get a jwt token before visiting any other URL
- Only the admin user can access all users / books (full-empowerment of CRUD)
- Non-admin users can access user and book data under their own account (limited CRUD)
### System dependencies:
  - Ruby 3.0.3
  - Rails 7.0.3
  - PostgreSQL 14.3
  - jwt
  - bcrypt
  - Pundit

### Initial Setup
  After git clone, please run `bundle install` & `bin/rails db:setup` & `bin/rails server`
  > `db:setup` stands for `db:create & db:migrate & db:seed`
  - `seed.rb` has config 3 users and 3 books, user 1 owns one book, user 2 owns 2 books, user 3 is an admin user without any book

### Generate a User Login Token
  - please use `POST` method to send a request to URL `http://localhost:3000/auth/login` 
  - request params with the test account
    - user 2: `username: Joshua 2` & `password: password2` OR
    - admin user: `username: Joshua 3` & `password: password3`
  - then you can get a `token` in the response body which will expire in 48 hours

### Play with the app

  #### with Admin token
  - with an admin token, you can create a new user or a new book and also update users or book data. Here will show you a few examples, more URLs, and methods please check `routes.rb` / `controllers`

  - `GET` all users
    - visit URL `http://localhost:3000/api/v1/users` in your browser or in postman with `GET` method, and get the response of a JSON: 
  ```json
    [
      {
          "id": 1,
          "username": "Joshua 1",
          "password": "password1",
          "created_at": "2022-06-21T16:24:01.413Z",
          "updated_at": "2022-06-21T16:24:01.413Z",
          "admin": false
      },
      {
          "id": 2,
          "username": "Joshua 2",
          "password": "password2",
          "created_at": "2022-06-21T16:24:01.458Z",
          "updated_at": "2022-06-21T16:24:01.458Z",
          "admin": false
      },
      {
          "id": 3,
          "username": "Joshua 3",
          "password": "password3",
          "created_at": "2022-06-21T16:24:01.458Z",
          "updated_at": "2022-06-21T16:24:01.458Z",
          "admin": true
      }
    ]
  ```

  - `GET` all books
    - by pasting this URL `http://localhost:3000/api/v1/books` in your browser or in postman with `GET` method, and get the response of a JSON: 
    ```json
    [
      {
          "id": 1,
          "user_id": 1,
          "book": "Testing Book 1",
          "likes_books": 1,
          "created_at": "2022-06-21T16:24:01.490Z",
          "updated_at": "2022-06-21T16:24:01.490Z"
      },
      {
          "id": 2,
          "user_id": 1,
          "book": "Testing Book 2",
          "likes_books": 2,
          "created_at": "2022-06-21T16:24:01.523Z",
          "updated_at": "2022-06-21T16:24:01.523Z"
      },
      {
          "id": 3,
          "user_id": 2,
          "book": "Testing Book 3",
          "likes_books": 3,
          "created_at": "2022-06-21T16:24:01.528Z",
          "updated_at": "2022-06-21T16:24:01.528Z"
      },
      {
          "id": 4,
          "user_id": 2,
          "book": "Testing Book 4",
          "likes_books": 4,
          "created_at": "2022-06-21T16:24:01.534Z",
          "updated_at": "2022-06-21T16:24:01.534Z"
      }
    ]
    ```
  #### with User2 token
  - `GET` all books belong to user_id: 2
    - visit URL `http://localhost:3000/api/v1/books` in your browser or in postman with `GET` method, and get the response of a JSON: 
    ```json
    [
        {
            "id": 2,
            "user_id": 2,
            "book_name": "Testing Book 2",
            "likes": 2,
            "created_at": "2022-06-27T14:33:39.157Z",
            "updated_at": "2022-06-30T09:14:14.840Z"
        },
        {
            "id": 3,
            "user_id": 2,
            "book_name": "Testing Book 3",
            "likes": 3,
            "created_at": "2022-06-27T14:33:39.164Z",
            "updated_at": "2022-06-27T14:33:39.164Z"
        }
    ] 
    ```
