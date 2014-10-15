jQuery(function($) {

	Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
	var $form = $('#new_order');

	$form.submit(function(e) {

		// Disable the submit button to prevent repeated clicks
		$form.find('button').prop('disabled', true);

		Stripe.card.createToken($form, stripeResponseHandler);

		// Prevent the form from submitting with the default action
		return false;
	});

	var stripeResponseHandler = function(status, response) {

		if (response.error) {
			// Show the errors on the form
			$form.find('.payment-errors').text(response.error.message);
			$form.find('button').prop('disabled', false);
		} else {
			// token contains id, last4, and card type
			var token = response.id;
			// Insert the token into the form so it gets submitted to the server
			$form.find('#order_stripe_card_token').val(token);
			// and re-submit
			$form.get(0).submit();
		}
	};
});