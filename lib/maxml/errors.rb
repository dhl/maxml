module MaxML
  module Errors

    class InvalidConfig < ArgumentError
      def initialize
        super("DB options should be a hash")
      end
    end

    class InvalidConfigOption < ArgumentError
      def initialize(name)
        super("Missing DB Configuration property :#{name}. Make sure that " +
              "MongoPersistence.config is called from your code.")
      end
    end
    
  end
end
