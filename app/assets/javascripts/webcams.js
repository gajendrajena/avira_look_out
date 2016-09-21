$(document).ready(function(){
	var pic_arr1 = [1,2,3];
	var pic_arr2 = [1,2,3], pic_id = 1, web_cam_id = 0;
	var counter1 = 0, counter2 = 0;

	$(document).on('submit', 'form#web_cams', function(e){
		e.preventDefault();
		web_cam_id = $('select#cam').val();
		if(web_cam_id) {
			fetch_image();
		} else {
			alert('Select a web cam');
		}
	});

	var fetch_image = function(){

			if(web_cam_id == 1){
				pic_id = pic_arr1[counter1];
				counter1 += 1;
				if(counter1 == 3) {
					counter1 = 0;
				}
			} else if(web_cam_id == 2){
				pic_id = pic_arr2[counter2];
				counter2 += 1;
				if(counter2 == 4) {
					counter2 = 0;
				}
			}

		$.ajax({
			url: '/webcams/' + web_cam_id,
			data: {pic_id: pic_id},
			method: 'get',
			dataType: 'json',
			beforeSend: showLoading,
			complete: hideLoading,
			success: handleSuccess,
			error: showError
		});
	};

	var handleSuccess = function(data, textStatus, qXHR ) {
		if(textStatus === 'success') {
			$('#show-cam').prop('src', data.image);
			$('#web_cam_id').text(web_cam_id);

			setTimeout(fetch_image, 5000)
		}
	};

	var showLoading = function() {
		$('body').addClass('waiting');
	}
	var hideLoading = function() {
		$('body').removeClass('waiting');
	}
	var showError = function() {
		var alert_div = '<div class="alert alert-danger alert-dismissible fade in" role="alert">\
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">\
				<span aria-hidden="true">×</span>\
			</button>\
			<h4>Oh snap! You got an error!</h4>\
			<p>Change the webcam and try again.</p>\
		</div>';
		$('#flash').html(alert_div);
	}
});