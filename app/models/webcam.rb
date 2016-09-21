class Webcam < ApplicationRecord

	def get_image(pic_id)
		"/assets/webcam#{id}-#{pic_id}.jpg"
	end
end
