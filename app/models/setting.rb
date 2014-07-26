class Setting < ActiveRecord::Base
	scope :members, -> { where("name = 'members'").first }
	scope :totals, -> { where("name = 'totals'").first }
end
