module ActionView
  module Helpers
    module CacheHelper
      def cache(name = {}, options = nil, dynamic_vars = nil, &block)
        if controller.perform_caching
          ParameterizedCache.values = dynamic_vars
          safe_concat(fragment_for(name, options, &block))
        else
          yield
        end

        nil
      end
      
      def fragment_for(name, options, content)
        if controller.fragment_exist?(name, options)
          controller.read_fragment(name, options).gsub(/____ PC: (\w+) ____/) { ParameterizedCache.get($1) }
        else
          controller.write_fragment(name, capture(&block), options).gsub(/____ PC: (\w+) ____/) { ParameterizedCache.get($1) }
        end
      end
    end
  end
end