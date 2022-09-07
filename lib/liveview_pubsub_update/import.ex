defmodule LiveviewPubsubUpdate.Import do
  use GenServer
  
  require Logger
  
  def start() do
    GenServer.start(__MODULE__, nil)
  end

  @impl true
  def init(_params) do
    Enum.map(1..1000000, fn datum ->
      Logger.info("process: #{datum}")
      
      Phoenix.PubSub.broadcast(LiveviewPubsubUpdate.PubSub, "import_live", {:message, datum, Timex.now()})
    end)
    
    Logger.info("Enum map finished")
    
    {:ok, nil}
  end
end
