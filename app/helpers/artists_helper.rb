module ArtistsHelper
	def link_to_rrss(rrss,index)
		types = {
					0 => ['flaticon-twitter', 'https://twitter.com/intent/user?screen_name='],
					1 => ['flaticon-facebook2', 'https://www.facebook.com/'],
					2 => ['flaticon-instagram13', 'https://www.instagram.com/'],
					3 => ['flaticon-pinterest11', 'https://www.pinterest.com/'],
					4 => ['flaticon-googleplus2', 'https://plus.google.com/']
				}	
		type = types[index]	
	    link_to "<i class='#{type[0]}'></i>".html_safe, "#{type[1]}=#{rrss}" if rrss.present?
	end	

end
