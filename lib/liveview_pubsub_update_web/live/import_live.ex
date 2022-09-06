defmodule LiveviewPubsubUpdateWeb.ImportLive do
  use LiveviewPubsubUpdateWeb, :live_view
  
  require Logger
  
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Phoenix.PubSub.subscribe(LiveviewPubsubUpdate.PubSub, "import_live")
    end
    
    {:ok, socket}
  end
  
  def render(assigns) do
    ~H"""
    <div>
      <button phx-click="process">Start</button>
    </div>
    """
  end
  
  def handle_event("process", _params, socket) do
    LiveviewPubsubUpdate.Import.start()
    
    {:noreply, socket}
  end
  
  def handle_info({:message, datum}, socket) do
    Logger.info("handle info: #{datum}")

    {:noreply, socket}
  end
end
