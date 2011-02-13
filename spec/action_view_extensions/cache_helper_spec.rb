require "spec_helper"

describe ActionView::Helpers::CacheHelper do
  it "allows dynamic content as parameters" do
    should_receive(:safe_concat).with("The President is: George Bush")
    should_receive(:safe_concat).with("The President is: Barack Obama")
    
    cache("president", {}, :name => "George Bush") { "The President is: #{@name}" }
    cache("president", {}, :name => "Barack Obama") { "The President is: #{@name}" }
  end
end
