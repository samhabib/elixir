defmodule TakeANumber do
  def start() do
      spawn(fn -> loop(0) end)
  end

  def loop(arg) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, arg) 
        loop(arg)
      {:take_a_number, sender_pid} ->
        send(sender_pid, arg + 1)
        loop (arg + 1)
      :stop -> nil
      _ -> loop(arg)
    end 
  end    
end