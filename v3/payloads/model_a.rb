

module Model_a
	@name = "Model_a"
	class << self 
		attr_reader :name
	end
	
	def signup_reqs # Required fields
		return %w{user pass email firstname lastname}
	end
	module_function :signup_reqs
	
	def suverify_reqs # Required fields
		return %w{ email pass }
	end
	module_function :suverify_reqs
	
	def login_reqs # Required fields
		return %w{ email pass }
	end
	module_function :login_reqs
	
	def signup(arr_in)
		print "-"*40
		print "\n"
		print "#{@name} signup has successfully retrieved the following. \n"
		print "Username: #{arr_in['user']} \n"
		print "Password: #{arr_in['pass']} \n"
		print "E-Mail: #{arr_in['email']} \n"
		print "First Name: #{arr_in['firstname']} \n"
		print "Last Name: #{arr_in['lastname']} \n"
		print "\n"
	end
	module_function :signup
	
	def suverify(arr_in)
		print "-"*40
		print "\n"
		print "#{@name} suverify has successfully retrieved the following. \n"
		print "E-Mail: #{arr_in['email']} \n"
		print "Password: #{arr_in['pass']} \n"
		print "\n"
	end
	module_function :suverify
	
	def login(arr_in)
		print "-"*40
		print "\n"
		print "#{@name} login has successfully retrieved the following. \n"
		print "E-Mail: #{arr_in['email']} \n"
		print "Password: #{arr_in['pass']} \n"
		print "\n"
	end
	module_function :login
end
