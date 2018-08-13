require "./echo/*"
require "socket"


module Echo
  # # TCP鯖
  # server = TCPServer.new(2000)
  # counter : Int64 = 0
  # loop do
  #   server.accept do |socket|
  #     p socket
  #     while buffer = socket.gets
  #       puts buffer
  #     end
  #     socket.puts "Hello #{Time.now} counter:#{counter}"
  #     socket.close
  #     counter += 1
  #   end
  # end

  # シンプルHTTP鯖
  server = TCPServer.new(2000)
  loop do
    server.accept do |socket|
      p socket
      headers : Array(String) = Array(String).new
      while header = socket.gets
        break if header.chomp.empty?
        headers << header.chomp
      end
      p headers

      socket.puts "HTTP/1.0 200 OK"
      socket.puts "Content-Type: text/plain"
      socket.puts
      socket.puts "message body"
      socket.close
    end
  end
end
