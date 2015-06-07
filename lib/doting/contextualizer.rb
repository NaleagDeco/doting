# The object that applies a supplied context to a supplied template, returning
# the applied content

require 'erubis'

module Doting
  # The contextualizer class
  class Contextualizer
    class << self
      def contextualize(template, context)
        e = Erubis::Eruby.new(template)
        e.result(context)
      end
    end
  end
end
