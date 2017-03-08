# To-Do API

* Return JSON representations of users, lists, and items
* Authenticate user from the command line, using a username and password

```
curl -u username:password https://aso4-todoapi.herokuapp.com/api/users/
```

* Create new users, lists, and items from the command line

```
curl -u username:password -d "user[username]=Sterling" -d "user[password]=Archer" https://aso4-todoapi.herokuapp.com/api/users/
curl -u username:password -d "list[name]=Things to do today" -d "list[permissions]=private" https://aso4-todoapi.herokuapp.com/api/users/1/lists
curl -u username:password -d "item[description]=Dance if you want to" https://aso4-todoapi.herokuapp.com/api/lists/1/items
```

* Remove users and lists from the command line

```
curl -u username:password -X DELETE https://aso4-todoapi.herokuapp.com/api/users/1/
curl -u username:password -X DELETE https://aso4-todoapi.herokuapp.com/api/users/1/lists/1
```

* Update list and item attributes from the command line. Updates with permissions that are not private, viewable, or open are rejected

```
curl -X PUT -u username:password -d "list[permissions]=open" https://aso4-todoapi.herokuapp.com/api/lists/1
curl -X PUT -u username:password -d "item[completed]=true" https://aso4-todoapi.herokuapp.com/api/items/1
```

* Prevent a user from modifying other users' lists or items
* Add index methods to the API for lists and items
