class URLHandler
  def initialize(param)
    @param = param
  end

  def url
    parsed_url = parsed_url(url)
    response_body(parsed_url)
  end

  attr_accessor :param

  def parsed_url(url)
    u = URI.parse(url)
    return if u.scheme

    'http://' + url
  end
end