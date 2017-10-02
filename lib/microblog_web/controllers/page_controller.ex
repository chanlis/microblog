defmodule MicroblogWeb.PageController do
  use MicroblogWeb, :controller

  def index(conn, _params) do
    render conn, to: message_path(conn, :index)
  end
end
