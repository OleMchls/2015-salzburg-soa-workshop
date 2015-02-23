require_relative '../lib/link_header.rb'

describe LinkHeader::Link do
  it "can parse a single link header" do
    link = LinkHeader::Link.parse('<https://api.github.com/users/steveklabnik/gists?page=2>; rel="next"')
    expect(link.url).to eq 'https://api.github.com/users/steveklabnik/gists?page=2'
    expect(link.type).to eq 'next'
  end

  it "raises an error when parsing invalid link formats" do
    expect {
      LinkHeader::Link.parse('<https://api.github.com/users/steveklabnik/gists?page=2; rel="next"')
    }.to raise_error
  end

  it "can format a link correctly" do
    expect(LinkHeader::Link.new(type: 'next', url: 'http://example.com?page=3').to_s).to eq '<http://example.com?page=3>; rel="next"'
  end
end


describe LinkHeader do
  it "can parse a multi link header string" do
    links = LinkHeader.parse('<https://api.github.com/users/steveklabnik/gists?page=2>; rel="next", <https://api.github.com/users/steveklabnik/gists?page=33333>; rel="last"')
    expect(links['next'].url).to eq 'https://api.github.com/users/steveklabnik/gists?page=2'
    expect(links['last'].url).to eq 'https://api.github.com/users/steveklabnik/gists?page=33333'
  end

  context "with links" do
    before do
      @links = LinkHeader.new
      @links['next'] = 'http://example.com/blub?page=4'
      @links['first'] = 'http://example.com/blub?page=1'
    end

    it "can format links correctly" do
      expect(@links.to_s).to eq '<http://example.com/blub?page=4>; rel="next", <http://example.com/blub?page=1>; rel="first"'
    end

    it "knows it's types" do
      expect(@links.types.sort).to eq ['first', 'next']
    end
  end
end
