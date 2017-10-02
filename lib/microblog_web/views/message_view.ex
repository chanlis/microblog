defmodule MicroblogWeb.MessageView do
  use MicroblogWeb, :view

  def message_owner(message) do
    if message.user do
      message.user.email
    else
      "none"
    end
  end
end
