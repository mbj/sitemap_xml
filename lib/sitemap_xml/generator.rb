module SitemapXML
  # Abstract XML generator base class
  class Generator
    include Adamantium::Flat, AbstractType

    # Generate blob from items
    #
    # @param [Enumerable<Object>] items
    #
    # @return [String]
    #
    # @api private
    #
    def self.generate(items)
      io = StringIO.new
      self.new(items).write(io)
      io.rewind
      io.read
    end

    # Enumerate chunks of data
    #
    # @return [self]
    #   if block is given
    #
    # @return [Enumerator<String>]
    #   otherwise
    #
    # @api private
    #
    def each
      return to_enum unless block_given?

      klass = self.class

      yield klass::HEADER

      input.each do |item|
        yield xml(item)
      end

      yield klass::FOOTER 

      self
    end

    # Write chunks to io
    #
    # @param [IO] io
    #
    # @return [self]
    #
    # @api private
    #
    def write(io)
      each do |chunk|
        io << chunk
      end

      self
    end

    # Return input
    #
    # @return [Enumerable<Object>] 
    #
    # @api private
    #
    attr_reader :input

  private

    # Initialize object
    #
    # @param [Enumerable<Object>] input
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize(input)
      @input = input
    end

    # Return xml for item
    # 
    # @param [Object] item
    #
    # @return [String]
    #
    # @api private
    #
    def xml(item)
      presenter.xml(item)
    end

    # Return presenter
    #
    # @return [#xml]
    #
    # @api private
    #
    def presenter
      self.class::PRESENTER
    end

  end
end
