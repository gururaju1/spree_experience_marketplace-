#= require spree/backend

$(document).ready ->
  if $('.new_experience_bank_account').length > 0
    $('.new_experience_bank_account').submit ->
      if $('#experience_bank_account_token').val() == ''
        Stripe.bankAccount.createToken({
            country: $('#experience_bank_account_country_iso').val(),
            routingNumber: $('#experience_bank_account_routing_number').val(),
            accountNumber: $('#experience_bank_account_account_number').val(),
        }, stripeBankAccountResponseHandler);
        return false

stripeBankAccountResponseHandler = (status, response) ->
  if response.error
    $('#stripeError').html(response.error.message)
    $('#stripeError').show()
  else
    $('#experience_bank_account_account_number').prop("disabled" , true);
    $('#experience_bank_account_routing_number').prop("disabled" , true);
    $('#experience_bank_account_masked_number').val('xxxxxx' + response['bank_account']['last4'])
    $('#experience_bank_account_name').val(response['bank_account']['bank_name'])
    $('#experience_bank_account_token').val(response['id'])
    $('.new_experience_bank_account').submit()