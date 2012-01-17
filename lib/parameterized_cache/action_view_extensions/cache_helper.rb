module ActionView
  module Helpers
    module CacheHelper
      def cache(name = {}, options = nil, dynamic_vars = {}, &block)
        if controller.perform_caching
          ParameterizedCache.values = dynamic_vars
          dynamic_vars.keys.each do |key|
            instance_variable_set("@#{key}", "____PC:#{key}____")
          end
          fragment = fragment_for(name, options, &block)
          fragment.gsub(/____PC:\w+____/) { |match| ParameterizedCache.get(match.gsub(/____|PC:/, "")) }
          safe_concat(fragment)
        else
          yield
        end

        nil
      end
    end
  end
end
