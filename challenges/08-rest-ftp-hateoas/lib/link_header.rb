class LinkHeader
  class Link
    PATTERN = /<([^>]+)>; rel="([a-z0-9\.-]+)"/

    attr_reader :type, :url

    def initialize(type:, url:)
      @type = type
      @url = url
    end

    def to_s
      "<#{@url}>; rel=\"#{@type}\""
    end

    def self.parse(link_string)
      if match = link_string.match(PATTERN)
        url, type = match.captures
        new(type: type, url: url)
      else
        raise "Invalid Link String: #{link_string}"
      end
    end
  end

  def initialize(links: {})
    @links = links
  end

  def types
    @links.keys
  end

  def [](type)
    @links[type]
  end

  def []=(type, url)
    @links[type] = Link.new(type: type, url: url)
  end

  def to_s
    @links.values.map(&:to_s).join(', ')
  end

  def self.parse(link_headers_string)
    links = link_headers_string.split(', ').map { |string| Link.parse(string.strip) }
    new(links: links.map { |link| [link.type, link] }.to_h)
  end
end
