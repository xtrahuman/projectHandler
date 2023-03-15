# project handler

A RESTFUL API built with Ruby on Rails


## Getting Started

To get a local copy up and running follow these simple example steps.

- copy this link `https://github.com/xtrahuman/projectHandler.git`.
- get the directory that you want to clone the repository.
- open the command prompt in this directory.
- write `git clone https://github.com/xtrahuman/projectHandler.git`.
- go to the repository folder in your command prompt.
- run `bundle install`.
- fill up your exiting postgres password and username in database.yml, for access to your postgres. advisable to use environment variable
- create database `rails db:create`
- Migrate database `rails db:migrate`
- type `rails s -p 3003` to start up server
- replace baseUrl with `http://127.0.0.1:3003`

deployed ```baseUrl = projecthandler.fly.dev```

## get conversations

request : get

```http://projecthandler.fly.dev/projects/:project_id/conversations```

```status: false , means project ongoing```
```status: true , means project completed```

## get all users

request: Get

```http://projecthandler.fly.dev/users```

## create users
request: post
```http://projecthandler.fly.dev/users```

body 

```
{
"user_name" : required,
"name": optional,
"role": optional,
"bio": optional
}
```

## update user info
Request: patch
```http://projecthandler.fly.dev/users/:user_id```

body

any of below

```
{
"user_name" : username,
"name": optional,
"role": optional,
"bio": optional
}
```

## delete user

request: delete

```http://projecthandler.fly.dev/users/:user_id```


## get all projects

Request: Get

```http://projecthandler.fly.dev/projects```

## create project

Request: post

```http://projecthandler.fly.dev/projects```

body

```
{
user_id: required,
name: required,
status: default set at false,
}
```

## updated project

Request: patch

```http://projecthandler.fly.dev/projects/:project_id```

body

any of below

```
{
    "user_id": int,
    "status": boolean,
    "name": string
}
```

## delete project

request: delete

```http://projecthandler.fly.dev/projects/:project_id```

## create comment

request: post

```http://projecthandler.fly.dev/projects/1/comments```

body 

```
{
"user_id": id,
"message": "string"
}
```

## update comment

Request: patch

```http://projecthandler.fly.dev/projects/:project_id/comments/:comment_id```

body

```
{
"message": "string"
}
```

## delete comment

request: delete

```http://projecthandler.fly.dev/projects/:project_id/comments/:comment_id```

## Get all comments

request: get

```http://projecthandler.fly.dev/projects/:project_id/comments```


## question i could ask my colleague

- if the userId is needed to view project?
- would the project be private to certain users or public?
- if some users would have permission to delete project?
- when the user is deleted should the comment or project also be deleted?
- if a project is deleted would the comments be deleted?

## answer i could recieve

- userid not needed to view project
- user with an id can create project and comment
- when user is deleted the project and comment is deleted
- when project is deleted the comments also get deleted
- role should be applied to users to give it authorization to perform admin task


