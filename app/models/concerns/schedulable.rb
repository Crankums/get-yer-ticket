module Scheduleable
    def overlap?(dr)
        # (dr.start_time > self.start_time && self.end_time > dr.start_time) || (dr.start_time < self.start_time && dr.end_time > self.start_time)
    end
end
