require "./echo/*"
require "socket"

module Echo
  server = TCPServer.new(2000)
  counter : Int64 = 0
  loop do
    server.accept do |socket|
      p socket
      socket.puts "Hello #{Time.now} counter:#{counter}"
      socket.close
      counter += 1
    end
  end
end
