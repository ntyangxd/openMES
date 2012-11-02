class Dept < ActiveRecord::Base
  attr_accessible :code, :memo, :name, :person

  self.per_page = 10
end
