module ActionView
  module Helpers
    module CacheHelper
      def cache(name = {}, options = nil, dynamic_vars = {}, &block)
        if controller.perform_caching
          ParameterizedCache.values = dynamic_vars
          dynamic_vars.keys.each do |key|
            instance_variable_set("@#{key}", "____PC:#{key}____")
          end
          safe_concat(fragment_for(name, options, &block))
        else
          yield
        end

        nil
      end

      def fragment_for(name, options, &block)
        if controller.fragment_exist?(name, options)
          fragment = controller.read_fragment(name, options) || ""
          fragment.gsub(/____PC:\w+____/) { |match| ParameterizedCache.get(match.gsub(/____|PC:/, "")) }
        else
          fragment = controller.write_fragment(name, capture(&block), options) || ""
          fragment.gsub(/____PC:\w+____/) { |match| ParameterizedCache.get(match.gsub(/____|PC:/, "")) }
        end
      end
    end
  end
end
