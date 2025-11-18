class ResponseTimer
  def initialize(app, message = "Response Time")
    @app = app
    @message = message
  end

  def call(env)
    start = Time.now
    status, headers, response = @app.call(env)
    stop = Time.now

    content_type = headers.find { |k, v| k.to_s.downcase == "content-type" }&.last

    if content_type&.include?("text/html")
      Rails.logger.info "Injecting HTML comment, response type: #{content_type}"
      body = +""
      response.each { |part| body << part }
      body << "<!-- #{@message}: #{stop - start} -->\n"
      Rails.logger.info "#{@message}: #{stop - start} seconds"
      headers["Content-Length"] = body.bytesize.to_s if headers["Content-Length"]
      [status, headers, [body]]
    else
      Rails.logger.info "Skipping comment injection, response type: #{content_type}"
      [status, headers, response]
    end
  end
end
