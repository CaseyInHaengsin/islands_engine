defmodule IslandsEngine.DemoProc do
  def loop() do
    receive do
      message -> IO.puts("I got the message #{message}")
    end

    loop()
  end
end
