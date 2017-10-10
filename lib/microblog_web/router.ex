defmodule MicroblogWeb.Router do
  use MicroblogWeb, :router
  import MicroblogWeb.Plugs

  pipeline :browser do
    plug :accepts, ["json"]
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :fetch_user
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_user
  end

  scope "/", MicroblogWeb do
    pipe_through :browser # Use the default browser stack
    get "/", MessageController, :index
    resources "/message", MessageController
    resources "/users", UserController
    resources "/folows", FollowController
    post "/sessions", SessionController, :login
    delete "/sessions", SessionController, :logout
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", MicroblogWeb do
    pipe_through :api
    
    resources "/likes", LikeController, except: [:new, :edit] 
  end
end
