require 'action_view'

require 'parameterized_cache/action_view_extensions'
require 'parameterized_cache/helpers'

module ParameterizedCacheIncludes
  include DynamicValuesHelper
end

class ParameterizedCache
  def self.values
    @dynamic_values ||= {}
  end
  
  def self.values=(values)
    @dynamic_values = values.stringify_keys!
  end
  
  def self.get(key)
    self.values[key]
  end
end
  