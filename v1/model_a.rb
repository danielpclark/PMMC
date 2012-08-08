

module Model_a
	def reqs # Required fields
		return %w{user pass email firstname lastname}
	end
	module_function :reqs
	
	def signup(arr_in)
		print "-"*40
		print "\n"
		print "Model has successfully retrieved the following. \n"
		print "Username: #{arr_in['user']} \n"
		print "Password: #{arr_in['pass']} \n"
		print "E-Mail: #{arr_in['email']} \n"
		print "First Name: #{arr_in['firstname']} \n"
		print "Last Name: #{arr_in['lastname']} \n"
		print "\n"
	end
	module_function :signup
end
