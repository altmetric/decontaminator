require 'oga'

class Decontaminator
  def initialize(options = {})
    @blacklisted_tags = NON_CONTENT_TAGS + options.fetch(:blacklist, [])
  end

  def fragment(html)
    sanitize(Oga.parse_html(html).children)
  end

  def self.fragment(html, options = {})
    new(options).fragment(html)
  end

  private

  attr_reader :blacklisted_tags

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

  def sanitize(node_set)
    node_set
      .reject(&method(:blacklisted?))
      .flat_map { |node| [whitespace(node, :prefix), text(node), whitespace(node, :suffix)] }
      .join
  end

  def blacklisted?(node)
    if text?(node)
      false
    else
      blacklisted_tags.include?(node.name)
    end
  end

  def text?(node)
    node.is_a?(Oga::XML::Text)
  end

  def whitespace(node, _position)
    if text?(node)
      ''
    elsif WHITESPACE_CONTENT_TAGS.include?(node.name)
      ' '
    else
      ''
    end
  end

  def text(node)
    if text?(node)
      node.text
    else
      sanitize(node.children)
    end
  end
end
