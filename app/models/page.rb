class Page < ActiveRecord::Base
  belongs_to :site


def increseCount
	self.total_visits = self.total_visits + 1
        self.save
 end

 def register_visit(duration)
      self.visits += 1
      self.total__duration += duration.to_i 
 end
 end
