module ApplicationHelper
	
	def publisher_details
		@publisher_list  = Publisher.all
		options = {}
		@publisher_list.each do |pub|
			options["#{pub.name} (#{pub.city}  #{pub.state})"] = pub.id
		end	
		options
	end

end
