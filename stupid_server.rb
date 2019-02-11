require 'socket'
require 'cgi'
server = TCPServer.new 5678

while session = server.accept
  request = session.gets
  puts request

  response = <<~HTML
    HTTP/1.1 200
    Content-Type: text/html

    <!DOCTYPE html>
    <html lang="en">
      <head>
          <meta charset="utf-8">
          <title>Stupid server said</title>
      </head>
      <body>
         <p>Hello world! Here the time: #{Time.new}</p>
         <p>#{CGI.escapeHTML(session.peeraddr.inspect)}</p>
         <p>#{CGI.escapeHTML(session.addr.inspect)}</p>
         <p>#{CGI.escapeHTML(session.remote_address.inspect)}</p>
         <p>#{CGI.escapeHTML(session.local_address.inspect)}</p>
      </body>
    </html>

  HTML
  session.print response

  session.close
end
