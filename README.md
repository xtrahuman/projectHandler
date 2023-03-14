# project handler

A RESTFUL API built with Ruby on Rails

```baseUrl = projecthandler.fly.dev```

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
```{
"user_name" : required,
"name": optional,
"role": optional,
"bio": optional
}```

## update user info
Request: patch
```http://projecthandler.fly.dev/users```

body
any of below
```{
"user_name" : username,
"name": optional,
"role": optional,
"bio": optional
}```

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
```{
user_id: required,
name: required,
status: default set at false,
}```

## updated project
Request: patch
```http://projecthandler.fly.dev/projects```
body
any of below
```{
    "user_id": int,
    "status": boolean,
    "name": string
}```

## delete project
request: delete
```http://projecthandler.fly.dev/projects/:project_id```

## create comment
request: post
```http://projecthandler.fly.dev/projects/1/comments```
body 
```{
"user_id": id,
"message": "string"
}```

## update comment
Request: patch
```http://projecthandler.fly.dev/projects/:project_id/comments```
body 
```{
"message": "string"
}```

## delete comment
request: delete
```http://projecthandler.fly.dev/projects/:project_id/comments/:comment_id```

## Get all comments
request: get
```http://projecthandler.fly.dev/projects/:project_id/comments```
body 
```{
"user_id": user_id,
"message": "string"
}```

