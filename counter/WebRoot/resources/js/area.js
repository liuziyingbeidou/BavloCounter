function showLocation(province , city , town) {
	
	var loc	= new Location();
	var title	= ['省份' , '地级市' , '市、县、区'];
	$.each(title , function(k , v) {
		title[k]	= '<option value="">'+v+'</option>';
	})
	
	$('#vprovince').append(title[0]);
	$('#vcity').append(title[1]);
	$('#vdistrict').append(title[2]);
	
	
	$('#vprovince').change(function() {
		$('#vcity').empty();
		$('#vcity').append(title[1]);
		loc.fillOption('vcity' , '0,'+$('#vprovince').val());
		$('#vdistrict').empty();
		$('#vdistrict').append(title[2]);
	})
	
	$('#vcity').change(function() {
		$('#vdistrict').empty();
		$('#vdistrict').append(title[2]);
		loc.fillOption('vdistrict' , '0,' + $('#vprovince').val() + ',' + $('#vcity').val());
	})
	
	$('#vdistrict').change(function() {
	})
	
	if (province) {
		loc.fillOption('vprovince' , '0' , province);
		
		if (city) {
			loc.fillOption('vcity' , '0,'+province , city);
			
			if (town) {
				loc.fillOption('vdistrict' , '0,'+province+','+city , town);
			}
		}
		
	} else {
		loc.fillOption('vprovince' , '0');
	}
		
}