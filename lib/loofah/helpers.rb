module Loofah
  module Helpers
    class << self
      #
      #  A replacement for Rails's built-in +strip_tags+ helper.
      #
      #   Loofah::Helpers.strip_tags("<div>Hello <b>there</b></div>") # => "Hello there"
      #
      def strip_tags(string_or_io)
        Loofah.fragment(string_or_io).text
      end

      #
      #  A replacement for Rails's built-in +sanitize+ helper.
      #
      #   Loofah::Helpers.sanitize("<script src=http://ha.ckers.org/xss.js></script>") # => "&lt;script src=\"http://ha.ckers.org/xss.js\"&gt;&lt;/script&gt;"
      #
      def sanitize(string_or_io, options={})
        old_opts = Loofah::HTML5::Scrub.options
        Loofah::HTML5::Scrub.options = options
        Loofah.scrub_fragment(string_or_io, :strip).to_s
        Loofah::HTML5::Scrub.options = old_opts
      end
    end
  end
end
