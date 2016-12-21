# To-Do API

* Return JSON representations of users, lists, and items
* Authenticate user from the command line, using a username and password

```
curl -u username:password http://localhost:3000/api/users/
```

* Create new users, lists, and items from the command line

```
curl -u username:password -d "user[username]=Sterling" -d "user[password]=Archer" http://localhost:3000/api/users/
curl -u username:password -d "list[name]=Things to do today" -d "list[permissions]=private" http://localhost:3000/api/users/1/lists
curl -u username:password -d "item[description]=Dance if you want to" http://localhost:3000/api/lists/1/items
```

* Remove users and lists from the command line

```
curl -u username:password -X DELETE http://localhost:3000/api/users/1/
curl -u username:password -X DELETE http://localhost:3000/api/users/1/lists/1
```

* Update list and item attributes from the command line. Updates with permissions that are not private, viewable, or open are rejected(*ongoing*)

```
curl -X PUT -u username:password -d "list[permissions]=open" http://localhost:3000/api/lists/1
curl -X PUT -u username:password -d "item[completed]=true" http://localhost:3000/api/items/1
```

curl -X PUT -u test2:123456 -d "list[permissions]=hidden" http://localhost:3000/api/lists/5
