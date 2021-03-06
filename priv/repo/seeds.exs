# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Microblog.Repo.insert!(%Microblog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Microblog.Repo
alias Microblog.User.Message
alias Microblog.Accounts.User
Repo.delete_all(User)
Repo.delete_all(Message)

Repo.insert!(%User{email: "admin@example.com", name: "Admin", is_admin?: true, password: "admincatperson", password_confirmation: "admincatperson", password_hash: Comeonin.Argon2.hashpwsalt("admincatperson")})
