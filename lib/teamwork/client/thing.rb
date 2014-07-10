module Teamwork

  class Thing

    def initialize(item)
      item.each_pair do |key, value|
        key = key.split(/[\s-]/).join('_').downcase
        singleton_class.class_eval do; attr_accessor key; end
        send("#{key}=", value)
      end
    end

  end

end