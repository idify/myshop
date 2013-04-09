jQuery(document).ready(function() {
	jQuery('#admin_filter_condition').change(function() {
		jQuery('#admin_filter_operator').html("<option value='is'>is</option>");
		if (jQuery.trim(jQuery('#admin_filter_condition').val()) == 'order_amount'){
			jQuery('#admin_filter_operator').html("<option value='is'>is</option><option value='greater_than'>> than</option><option value='less_than>'> < than</option><option value='greater_than_eql'>>=</option><option value='less_than_eql>'><=</option>");
		}
		
	});
});
