$:.unshift "."

PLdirectory = "payloads/"


module ControllerPL
	@sampleDB = {"user" => "KingOfWorld", "pass" => "IAmLegend", "email" => "BowToMe@MyDomain.gov", "firstname" => "Jean", "lastname" => "Jeffries"}
	class << self
		# Returns the sampleDB values.
		attr_accessor :sampleDB
	end
	
	def requestor(modulePL,feature)
		feature = feature + "_reqs"
		return modulePL.module_eval(feature)
	end
	module_function :requestor
	
	def lookup(reqslist)
		dbReply = {}
		reqslist.each do |val|
			dbReply[val] = sampleDB[val]
		end
		return dbReply
	end
	module_function :lookup
end

def requestLookupDo(model,feature) # Lookup for each model feature and execute.
	getReqs = ControllerPL.requestor(eval(model.capitalize),feature)
	lookupReqs = ControllerPL.lookup(getReqs)
	return eval(model.capitalize).send(feature, lookupReqs)
end

require 'find'

def splitLookDo(models_array, feature)
	models_array.each do |payload|
		plName = payload.chomp('.rb').split("_")
		if !!payload[feature]
			requestLookupDo(plName[1],feature)
		end
	end
end

# First TYPE DEMONSTRATION.  (Partial models)
def splitModelsDemo() # For models split out over various files.
	#print "#{__LINE__} Hello splitModelsDemo!\n"
	$all_split_models = [] 
	Find.find(PLdirectory) do |payload|
		payload = payload.split('/')[-1]
		#print "#{__LINE__} ", payload, "\n"
		if !!payload[1..4]["_"]
			#puts "#{__LINE__} Inner truth here #{payload}"
			$all_split_models += [payload]
		end
	end
	#print "#{__LINE__} Hello $all_split_models! #{$all_split_models.join(' ')}\n"
	payload_functions = {}
	$all_split_models.each do |payload|
		require PLdirectory + payload
		plName = payload.chomp('.rb').split("_")
		#print "#{__LINE__} "
		#p plName
		if payload_functions.key?(plName[1])
			payload_functions[plName[1]] += [plName[2]]
		else payload_functions.nil?
			payload_functions[plName[1]] = [plName[2]]
		#else
		#	raise StandardError.new("You shouldn't get here!")
		end
	end
	splitLookDo($all_split_models, "signup")
	splitLookDo($all_split_models, "suverify") #sign up verification
	splitLookDo($all_split_models, "login")
end


# Second TYPE DEMONSTRATION.  (Wholesome models)
def completeModelsDemo() # For models all contained in individual files.
	$all_models = [] 
	Find.find(PLdirectory) do |payload|
		payload = payload.split('/')[-1]
		#print "#{__LINE__} ", payload, "\n"
		if not !!payload[1..4]["_"] and !!payload['.rb']
			#puts "#{__LINE__} Inner truth here #{payload}"
			require PLdirectory + payload.chomp(".rb")
			$all_models += [payload.chomp(".rb")]
		end
	end
	$all_models.each do |payload|
		requestLookupDo(payload,"signup")
		requestLookupDo(payload,"suverify")
		requestLookupDo(payload,"login")
	end
end

splitModelsDemo

completeModelsDemo


#$all_models.each do |model|
#	require model
#	requestLookupDo(model,"signup")
#	requestLookupDo(model,"login")
#end
