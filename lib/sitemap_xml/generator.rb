module SitemapXML
  class Generator
    include Adamantium, AbstractClass

    # Generate blob from items
    #
    # @param [Enumerable<Object>] items
    #
    # @return [String]
    #
    def self.generate(items)
      io = StringIO.new
      self.new(items).write(io)
      io.rewind
      io.read
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

    # Enumerate chunks
    #
    # @return [self]
    #   if block given
    #
    # @return [Enumerator<String>]
    #   otherwise
    #
    # @api private
    #   
    abstract_method :each

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
    # @param [Object] input
    #
    # @return [String]
    #
    def xml(item)
      presenter.xml(item)
    end

    # Return presenter
    #
    # @return [#xml]
    #
    def presenter
      self.class::PRESENTER
    end

  end
end
