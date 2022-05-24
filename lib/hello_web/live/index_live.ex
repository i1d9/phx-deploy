defmodule HelloWeb.IndexLive do
  use HelloWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
    Rendering live view
    </div>
    """
  end
end
