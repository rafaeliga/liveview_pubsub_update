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
  
  def handle_info({:message, datum, time}, socket) do
    now = Timex.now()
    
    Logger.info("sent: #{time}")
    Logger.info("received: #{now}")
    
    Logger.info("diff: #{Timex.diff(time, now, :milliseconds)}")
    
    Logger.info("handle info: #{datum}")

    {:noreply, socket}
  end
end
