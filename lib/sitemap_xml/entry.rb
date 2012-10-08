module SitemapXML
  class Entry
    include Anima, Immutable

    # Anima attribute that defaults to nil
    class DefaultNil < ::Anima::Attribute
      DEFAULT = ::Anima::Default::Value.new(nil)
    end

    attribute :location
    attribute :last_modification, DefaultNil
    attribute :change_frequency,  DefaultNil
    attribute :priority,          DefaultNil

    include Equalizer.new(attribute_set.map(&:name))
  end
end
