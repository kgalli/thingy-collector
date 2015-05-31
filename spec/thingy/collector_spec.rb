require 'spec_helper'

describe Thingy::Collector do
  it 'has a version number' do
    expect(Thingy::Collector::VERSION).not_to be nil
  end

  before(:each) do
    class Book
      include Thingy::Collector
      attributes :title, :author
    end
  end

  describe '.attributes' do
    it "defines attributes" do
      expect(Book.attributes).to eql Set.new([:title, :author])
    end
  end

  describe 'accessors' do
    it 'provides getters for attributes' do
      book = Book.new
      book.title = 'The Story'
      expect(book.title).to eql 'The Story'
      expect(book.author).to eql nil
    end

    it 'provide setter for attributes' do
      book = Book.new
      book.title = 'The Story'
      expect(book.instance_variable_get(:@title)).to eql 'The Story'
      expect(book.title).to eql 'The Story'
    end
  end
end
