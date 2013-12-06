module Jekyll
  # Convert org-mode files.
  require 'org-ruby'
  class OrgConverter < Converter
    safe true
 
    def setup
      # No-op
    end
 
    def matches(ext)
      ext =~ /org$/i
    end
 
    def output_ext(ext)
      ".html"
    end
 
    def convert(content)
      setup
      Orgmode::Parser.new(content).to_html
    end
  end
end
