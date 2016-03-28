class Site < ActiveRecord::Base
  def increseCount
	self.count = self.count + 1
        self.save
 end
end
