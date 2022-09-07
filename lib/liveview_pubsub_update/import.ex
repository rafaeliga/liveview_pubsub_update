defmodule LiveviewPubsubUpdate.Import do
  use GenServer
  
  require Logger
  
  def start() do
    GenServer.start(__MODULE__, nil)
  end

  @impl true
  def init(_params) do
    {:ok, nil, {:continue, "continue"}}
  end
  
  @impl true
  def handle_continue("continue", state) do
    Enum.map(1..100000, fn item ->
      Logger.info("process: #{item}")
      
      Phoenix.PubSub.broadcast(LiveviewPubsubUpdate.PubSub, "import_live", {:message, item, Timex.now()})
    end)
    
    Logger.info("Enum map finished")
    
    {:noreply, state}
  end
end
