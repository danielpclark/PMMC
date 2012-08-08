

module Model
	class << self 
		attr_reader :name
	end
	
	def signup_reqs # Required fields
		return %w{user pass email firstname lastname}
	end
	module_function :signup_reqs
	
	def signup(arr_in)
		print "-"*40
		print "\n"
		print "#{__FILE__.chomp('.rb').split("/")[-1]} has successfully retrieved the following. \n"
		print "Username: #{arr_in['user']} \n"
		print "Password: #{arr_in['pass']} \n"
		print "E-Mail: #{arr_in['email']} \n"
		print "First Name: #{arr_in['firstname']} \n"
		print "Last Name: #{arr_in['lastname']} \n"
		print "\n"
	end
	module_function :signup
end
