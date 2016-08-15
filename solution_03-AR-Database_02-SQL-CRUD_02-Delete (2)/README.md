## Background & Objectives

Again, assume that your `Post` class has access to a global `DB`
variable defined as this:

```ruby
DB = SQLite3::Database.new("a_file.db")
```

## Specs

In this second exercise, we focus on **D**elete (the `D` in `CRUD`).

### `destroy`

Implement an **instance** method (why is it an instance method, and not
a class method like `Post.find`?) `destroy` that will delete the relevant
row from the database.

```ruby
post = Post.find(42)  # Get the row with id 42.
post.destroy          # TODO: get rid of that row in the database

# Expected result then
Post.find(42)
# => nil
```

This exercise should be done quicker than the previous one :)
