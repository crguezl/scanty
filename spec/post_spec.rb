require File.dirname(__FILE__) + '/base'

describe Post do
	before do
		@post = Post.new
	end

	it "has a url in simplelog format: /past/2008/10/17/my_post/" do
		@post.created_at = '2008-10-22'
		@post.slug = "my_post"
		expect(@post.url) == '/past/2008/10/22/my_post/'
	end

	it "has a full url including the Blog.url_base" do
    #binding.pry
		@post.created_at = '2008-10-22'
		@post.slug = "my_post"
		allow(Blog).to receive(:url_base).and_return('http://blog.example.com/')
		expect(@post.full_url) == 'http://blog.example.com/past/2008/10/22/my_post/'
	end

	it "produces html from the markdown body" do
		@post.body = "* Bullet"
		expect(@post.body_html) == "\n<ul>\n<li>Bullet</li>\n</ul>\n"
	end

	it "syntax highlights code blocks" do
		expect(@post.to_html("<code>\none\ntwo</code>")) == "\n<code><pre><span class=\"ident\">one</span>\n<span class=\"ident\">two</span></pre></code>\n"
	end

	it "makes the tags into links to the tag search" do
		@post.tags = "one two"
		expect(@post.linked_tags) == '<a href="/past/tags/one">one</a> <a href="/past/tags/two">two</a>'
	end

	it "can save itself (primary key is set up)" do
		@post.title = 'hello'
		@post.body = 'world'
		@post.save
		expect(Post.filter(:title => 'hello').first.body) == 'world'
	end

	it "generates a slug from the title (but saved to db on first pass so that url never changes)" do
		expect(Post.make_slug("RestClient 0.8")) == 'restclient_08'
		expect(Post.make_slug("Rushmate, rush + TextMate")) == 'rushmate_rush_textmate'
		expect(Post.make_slug("Object-Oriented File Manipulation")) == 'objectoriented_file_manipulation'
	end
end
