	var distributed_funds = 0;
	var sliders = Array();
	
	function updateDistributedFunds()
	{
		distributed_funds = 0;
		$(".bonus-slider").	each(function()	{ distributed_funds += parseInt($(this).val()); });
	}
	
	$(".bonus-slider").	each(function()
							{
								i = parseInt($(this).attr('id').split('-')[2]);
								sliders[i] = $("#bonus-slider-"+i).slider();
							});	

	$(".bonus-slider").on("slide", function(slideEvt)
	{

		var slided_i = parseInt($(this).attr('id').split('-')[2]);
		
		//set bonus for specific user
		$("#bonus-value-"+slided_i).attr('value', slideEvt.value);
		
		updateDistributedFunds();
		
		//update max value 
		$(".bonus-slider").	each(function(){
												i = parseInt($(this).attr('id').split('-')[2]);
												
												if(i != slided_i)
												{
													if( distributed_funds > max_funds)
													{
														val = sliders[i].slider('getValue');
														new_value = val - Math.abs((max_funds - distributed_funds));
														
														//I'm lazy so
														new_value = (new_value < 0 )?0:new_value;
														
														sliders[i].slider('setValue',new_value);
														$("#bonus-value-"+i).attr('value', new_value);
													}
												}
											});
		updateDistributedFunds();
		//console.log(distributed_funds); 
	});
	
	function sendToBoss()
	{
		$('#myModal').modal('show');
		//magic sending (:
	}
	$('#send-to-boss').click(function() { sendToBoss(); });
	
	