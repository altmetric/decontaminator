require 'rspec'

require_relative '../lib/decontaminator'

RSpec.describe Decontaminator do
  describe '.fragment' do
    it 'sanitizes an empty string' do
      expect(described_class.new.fragment('')).to eq('')
    end

    it 'sanitizes an empty paragraph' do
      expect(described_class.new.fragment('<p></p>')).to eq('  ')
    end

    it 'sanitizes a paragraph' do
      expect(described_class.new.fragment('<p>Text</p>')).to eq(' Text ')
    end

    it 'sanitizes a formatted paragraph' do
      expect(described_class.new.fragment('<p><b>Some</b> <i>text</i></p>')).to eq(' Some text ')
    end

    it 'sanitizes a formatted paragraph with attributes' do
      expect(described_class.new.fragment('<p class="text"><b data-important>Some</b> <i>text</i></p>')).to eq(' Some text ')
    end

    it 'sanitizes two formatted paragraphs' do
      expect(described_class.new.fragment('<p>Paragraph one.</p><p>Paragraph two.</p>')).to eq(' Paragraph one.  Paragraph two. ')
    end

    it 'sanitizes a link' do
      expect(described_class.new.fragment('<a href="#">link</a>')).to eq('link')
    end

    it 'sanitizes a script' do
      expect(described_class.new.fragment('<script>alert("I am evil but well formatted!");</script')).to eq('')
    end

    it 'sanitizes a stylesheet' do
      expect(described_class.new.fragment('<style>a{color:red}</style>')).to eq('')
    end

    it 'sanitizes multiple tags' do
      expect(described_class.new.fragment('<div><section><p>Section.</p></section><aside><p>Aside.</p></aside></div>')).to eq('   Section.    Aside.   ')
    end

    it 'sanitizes content with blacklisted tags' do
      expect(described_class.new(blacklist: %w(figcaption)).fragment('<figcaption>Blacklist this</figcaption><p>but not that</p>')).to eq(' but not that ')
    end
  end
end
