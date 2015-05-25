module ArtistsHelper
	def link_to_rrss(rrss)
		# twitter: 'asdasdf'
		types = {
					twitter:  ['flaticon-twitter', 'https://twitter.com/intent/user?screen_name='],
					facebook: ['flaticon-facebook2', 'https://www.facebook.com/'],
					instagram: ['flaticon-instagram13', 'https://www.instagram.com/'],
					pinterest: ['flaticon-pinterest11', 'https://www.pinterest.com/'],
					gplus: ['flaticon-googleplus2', 'https://plus.google.com/']
				}	

		type = types[:twitter] # TODO: types[rrss.key]		
	  link_to "<i class='#{type[0]}'></i>".html_safe, "#{type[1]}=#{rrss}"
	end	




end
