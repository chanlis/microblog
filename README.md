# Microblog

## Expected Behaviors
- LOGIN: user is able to log in with existing user. User that is an admin will have special permissions throughout the app.
- POST: only users that are logged in are able to post. Admin is only person able to edit or delete posts. Posts are meant to be permanate unless admin wishes to take it down.
- FOLLOW: the follow button can be found in the show page of each user. The follow button is meant to allow users to distinguish the users they follow's posts in the message path. I was not able to implement this function. This may change as soon as I figure out how to do so. Please help.
- APP DESIGN - much of the app was based off of Nat Tuck's NuMart design as it was clear and functional.

- link to repo: https://github.com/chanlis/microblog/
- link to app: http://microblog.catperson.fun/

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
