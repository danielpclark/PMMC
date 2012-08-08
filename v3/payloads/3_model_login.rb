

module Model
	class << self 
		attr_reader :name
	end
	
	def login_reqs # Required fields
		return %w{ email pass }
	end
	module_function :login_reqs
	
	def login(arr_in)
		print "-"*40
		print "\n"
		print "#{__FILE__.chomp('.rb').split("/")[-1]} has successfully retrieved the following. \n"
		print "E-Mail: #{arr_in['email']} \n"
		print "Password: #{arr_in['pass']} \n"
		print "\n"
	end
	module_function :login
end
