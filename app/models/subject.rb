class Subject < ActiveRecord::Base

	has_many :pages

	scope :visible, lambda {where(:visible=>true)}
	scope :search, lambda{|query|
		where (["name like ?","%#{query}%"])
	}

end
