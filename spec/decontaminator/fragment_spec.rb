require 'decontaminator'

RSpec.describe Decontaminator::Fragment do
  describe '#decontaminate' do
    it 'sanitizes an empty string' do
      expect(described_class.new('').decontaminate).to eq('')
    end

    it 'sanitizes an empty paragraph' do
      expect(described_class.new('<p></p>').decontaminate).to eq('  ')
    end

    it 'sanitizes a paragraph' do
      expect(described_class.new('<p>Text</p>').decontaminate).to eq(' Text ')
    end

    it 'sanitizes a formatted paragraph' do
      expect(described_class.new('<p><b>Some</b> <i>text</i></p>').decontaminate).to eq(' Some text ')
    end

    it 'sanitizes a formatted paragraph with attributes' do
      expect(described_class.new('<p class="text"><b data-important>Some</b> <i>text</i></p>').decontaminate).to eq(' Some text ')
    end

    it 'sanitizes two formatted paragraphs' do
      expect(described_class.new('<p>Paragraph one.</p><p>Paragraph two.</p>').decontaminate).to eq(' Paragraph one.  Paragraph two. ')
    end

    it 'sanitizes a link' do
      expect(described_class.new('<a href="#">link</a>').decontaminate).to eq('link')
    end

    it 'sanitizes a script' do
      expect(described_class.new('<script>alert("I am evil but well formatted!");</script').decontaminate).to eq('')
    end

    it 'sanitizes a stylesheet' do
      expect(described_class.new('<style>a{color:red}</style>').decontaminate).to eq('')
    end

    it 'sanitizes multiple tags' do
      expect(described_class.new('<div><section><p>Section.</p></section><aside><p>Aside.</p></aside></div>').decontaminate).to eq('   Section.    Aside.   ')
    end

    it 'sanitizes content with blacklisted tags' do
      expect(described_class.new('<figcaption>Blacklist this</figcaption><p>but not that</p>').decontaminate(blacklist: %w(figcaption))).to eq(' but not that ')
    end
  end
end
