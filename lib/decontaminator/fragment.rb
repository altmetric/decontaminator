require 'oga'

module Decontaminator
  class Fragment
    def initialize(html_fragment)
      @html_fragment = html_fragment
    end

    def decontaminate(options = {})
      blacklisted_tags = NON_CONTENT_TAGS + options.fetch(:blacklist, [])

      sanitize(Oga.parse_html(html_fragment).children, blacklisted_tags)
    end

    private

    attr_reader :html_fragment

    NON_CONTENT_TAGS = %w(
      script
      style
    )

    WHITESPACE_CONTENT_TAGS = %w(
      address
      article
      aside
      blockquote
      br
      dd
      div
      dl
      dt
      footer
      h1
      h2
      h3
      h4
      h5
      h6
      header
      hgroup
      hr
      li
      nav
      ol
      p
      pre
      section
      ul
    )

    def sanitize(node_set, blacklisted_tags)
      node_set
        .reject { |node| !text?(node) && blacklisted_tags.include?(node.name) }
        .flat_map { |node| [whitespace(node, :prefix), text(node, blacklisted_tags), whitespace(node, :suffix)] }
        .join
    end

    def text?(node)
      node.is_a?(Oga::XML::Text)
    end

    def whitespace(node, _position)
      if !text?(node) && WHITESPACE_CONTENT_TAGS.include?(node.name)
        ' '
      else
        ''
      end
    end

    def text(node, blacklisted_tags)
      if text?(node)
        node.text
      else
        sanitize(node.children, blacklisted_tags)
      end
    end
  end
end
