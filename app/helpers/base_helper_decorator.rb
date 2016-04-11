module Spree
	module BaseHelper
		def timeago(time)
			time_ago = ((Time.now - time) / 31536000) # returns a number in years
			#Less than a year ago
			if time_ago < 1
				time_ago *= 12
				# Less than a month ago
				if time_ago < 1
					time_ago *= 30
					# Less than a day ago
					if time_ago < 1 
						time_ago *= 24
						# Less than an hour ago
						if time_ago < 1
							time_ago *= 60
							# Less than a minute ago
							if time_ago < 1
								time_ago *= 60
								return "#{time_ago = time_ago.round} " + Spree.t(:second_ago)
							end
							return "#{time_ago = time_ago.round} " + Spree..t(:minutes_ago)								end
						return "#{time_ago = time_ago.round} " + Spree.t(:hours_ago)
					end
					return "#{time_ago = time_ago.round} " + Spree.t(:days_ago)
				end
				return "#{time_ago = time_ago.round } " + Spree.t(:months_ago)
			else
				return "#{time_ago = time_ago.round } " + Spree.t(:years_ago)
			end
		end
	end
end