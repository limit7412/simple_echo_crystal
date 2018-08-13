require "./echo/*"
# require "socket"
require "http/server"

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

  # # シンプルHTTP鯖
  # server = TCPServer.new(2000)
  # loop do
  #   server.accept do |socket|
  #     p socket
  #     headers : Array(String) = Array(String).new
  #     while header = socket.gets
  #       break if header.chomp.empty?
  #       headers << header.chomp
  #     end
  #     p headers

  #     socket.puts "HTTP/1.0 200 OK"
  #     socket.puts "Content-Type: text/plain"
  #     socket.puts
  #     socket.puts "message body"
  #     socket.close
  #   end
  # end

  # HTTP
  server = HTTP::Server.new do |context|
    context.response.content_type = "text/plain"
    context.response.print "Hello world!"
  end
  server.bind_tcp 2000
  puts "Listening"
  server.listen
end
