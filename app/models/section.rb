class Section < ActiveRecord::Base
	has_many :section_edits
	belongs_to :section
	has_many :editors, :throught=>:section_edits,:class_name=>"AdminUser"
end
