module GChart
  class Pie < GChart::Base
    
    attr_accessor :labels

    def initialize(*args, &block)
      @labels = []
      super
    end

    # A single array of chart data. Raises +ArgumentError+
    # if more than one data set is provided.
    def data=(data)
      if data.is_a?(Array) and data.first.is_a?(Array) and data.size > 1
        raise ArgumentError, "Pie charts only have one data set" 
      end
      
      super(data)
    end
    
    # overrides GChart::Base#query_params
    def query_params(params={}) #:nodoc:
      render_labels(params)
      super(params)
    end
  
    def render_chart_type #:nodoc:
      "p"
    end
    
    def render_labels(params) #:nodoc:
      params["chl"] = labels.join("|") if labels
    end
  end
end
