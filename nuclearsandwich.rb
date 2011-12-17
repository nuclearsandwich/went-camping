Camping.goes :Nuclearsandwich

module Nuclearsandwich::Controllers
  class Index < R '/'
    def get
      render :home
    end
  end

  class About
    def get
      @name = "Steven!"
      @employer = "NOWBOX" # soon to be For the betterment of all humankind
      render :about
    end
  end

  class CSSBootstrap < R '/css/bootstrap.min.css'
    def get
      headers['Content-Type'] = 'text/css'
      @css = File.read 'assets/css/bootstrap.min.css'
    end
  end
end

module Nuclearsandwich::Helpers
  def navigation active_page = nil
    div(id: 'navigation', class: 'container') do
      ul(class: 'tabs') do
        { "Home" => "/", "About" => "/about",
          "Blog" => "http://blog.nuclearsandwich.com" }.each do |title, uri|
            if title == active_page
              li(class: 'active') { a(href: uri) { title } }
            else
              li { a(href: uri) { title } }
            end
          end
      end
    end
  end
end

module Nuclearsandwich::Views
  def layout
    html do
      head do
        title { "Nuclearsandwich!" }
        link(rel: 'stylesheet', type: 'text/css', href: '/css/bootstrap.min.css')
      end

      div(class: 'container span10 offset3') { body { self << yield } }

      div(id: 'footer', class: 'container span10 offset3') do
        hr
        p do
          <<EOF
This website was made by Steven! Ragnarok as an experiment with
#{a(href: 'http://camping.rubyforge.org') { "Camping" }} and
#{a(href: 'http://twitter.github.com/bootstrap') { "Bootstrap" }}.
EOF
        end

        p do
          <<EOF
The source code for this page is
#{a(href: 'https://github.com/nuclearsandwich/nuclearsandwich.com'){ "public" }}
however what little content there is here is Copyright #{Time.now.year}.
EOF
        end
      end
    end
  end

  def home
    navigation 'Home'

    h1 { "Welcome!" }
    p do
      <<EOF
You've stumbled upon the front page of Steven! Ragnarok.

From here you can find out more #{a(href: '/about') { "about" }} me or check out
some of my public projects on
#{a(href: 'https://github.com/nuclearsandwich') { "GitHub" }} or
#{a(href: 'https://bitbucket.org/nuclearsandwich') { "BitBucket" }}.
I also write about technical and sundry topics on my
#{a(href: 'http://blog.nuclearsandwich.com') { "blog" }}.
EOF
    end
  end

  def about
    navigation 'About'

    div(class: 'span10') do
    p do
      <<EOF
#{@name} is a slightly mad (1) student of computer science and mathematics
currently attending San Jose State University and this is the only sentence in
this bio written in the third person. I like to write software and for the last
two-and-a-bit years have fancied myself a developer. I write chiefly in Ruby
but am interested in a #{a(href: '#langs-by-interest'){ "great" }}
#{a(href: "#langs-by-proficiency") { "many" }} programming languages.
EOF
    end

    p do
      <<EOF
At the moment I work for #{@employer} but I'm always on the lookout for cool and
exciting things. For the time being I can only work part time or by contract
since the one time I tried to maintain a full time position was disasterous for
my studies. I'm most likely to be great for you if you have custodial work such
as upgrading from an older version of Ruby or Rails, porting an MRI app to JRuby
or Rubinius, or getting tests on some legacy code. I point these things out
because they're fine tasks to assign someone who has a wild school schedule. I'm
not above or beneath building your core application, but it's hard to be a
dependable backbone developer when I may need to take a week off to really nail
an asignment and I don't want to put you or I in the position of hurting
schoolwork since it makes me ever so bitter.
EOF
    end
  end

    p(id: 'footnotes') do
      <<EOF
(1) Come now, I spell my name with an exclamation mark and study
mathematics, were you truly expecting normal?
EOF
    end

    h2(id: 'langs-by-interest') do
      "Programming Languages in which I am interested"
    end

    ul do
      li { a(href: "http://ruby-lang.org") { "Ruby" } }
      li { a(href: "http://fancy-lang.org") { "Fancy" } }
      li { a(href: "http://iolanguage.com") { "Io" } }
      li { a(href: "http://haskell.org") { "Haskell" } }
      li { a(href: "http://clojure.org") { "Clojure" } }
      li { a(href: "http://c.learncodetheharday.org") { "C" } }
      li { a(href: "http://redline.st") { "Redline Smalltalk" } }
      li { a(href: "http://mirah.org") { "Mirah" } }
      li { a(href: "http://coffeescript.org") { "CoffeeScript" } }
      li { a(href: "http://www.gnu.org/software/mit-scheme/") { "Scheme" } }
      li { a(href: "http://ruby-lang.org") { "Ruby" } }
      li { a(href: "https://developer.mozilla.org/en/HTML/HTML5") { "HTML5" } }
      li { a(href: "https://developer.mozilla.org/en/CSS") { "CSS" } }
    end

    h2(id: 'langs-by-proficiency') do
      "Programming Languages in which I am proficient"
    end

    ul do
      li { a(href: "http://github.com/nuclearsandwich/ruby_koans") { "Ruby" } }
      li { a(href: "http://github.com/nuclearsandwich/mancala") { "Java" } }
      li { a(href: "http://github.com/nuclearsandwich/clojure-koans") { "Clojure" } }
      li { a(href: "http://github.com/nuclearsandwich/lcthw_exercises") { "C" } }
    end
  end
end
