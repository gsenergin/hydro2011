// JavaScript Document
	/*$(function() {
		var dates = $( "#desde, #hasta" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 1,
			onSelect: function( selectedDate ) {
				var option = this.id == "desde" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				dates.not( this ).datepicker( "option", option, date );
			},
			maxDate: "+0M +0D"
		});
	});
*/
	var ahora = new Date();
	
	
	$('#desde').datetimepicker({
		timeFormat:'hh:mm:ss',
		ampm:false,
		showSecond: true,
		//maxDate: new Date(ahora.getFullYear(),ahora.getMonth(),ahora.getDate()),
		maxDate: new Date(),
		onSelect: function (selectedDateTime){
			var start = $(this).datetimepicker('getDate');
			$('#hasta').datetimepicker('option', 'minDate', new Date(start.getTime()) );
		}
	});
	
	$('#hasta').datetimepicker({
		timeFormat:'hh:mm:ss',
		ampm:false	,
		showSecond: true,
		//maxDate: new Date(ahora.getFullYear(),ahora.getMonth(),ahora.getDate()),
		maxDate: new Date(),
		onSelect: function (selectedDateTime){
			var end = $(this).datetimepicker('getDate');
			$('#desde').datetimepicker('option', 'maxDate', new Date(end.getTime()) );
		}
	});