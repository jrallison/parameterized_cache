module ActionView
  module Helpers
    module CacheHelper
      def cache(name = {}, options = nil, dynamic_vars = {}, &block)
        if controller.perform_caching
          ParameterizedCache.values = dynamic_vars
          dynamic_vars.keys.each do |key|
            instance_variable_set("@#{key}", "____ PC: #{key} ____")
          end
          safe_concat(fragment_for(name, options, &block))
        else
          yield
        end

        nil
      end
      
      def fragment_for(name, options, &block)
        if controller.fragment_exist?(name, options)
          controller.read_fragment(name, options).gsub(/____ PC: (\w+) ____/) { ParameterizedCache.get($1) }
        else
          controller.write_fragment(name, capture(&block), options).gsub(/____ PC: (\w+) ____/) { ParameterizedCache.get($1) }
        end
      end
    end
  end
end
