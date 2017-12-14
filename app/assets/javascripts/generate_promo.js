$(document).on('ready', function () {
    var code_input = $('#coupon_code');
    if (code_input) {
        code_input.after('<a id="generate-coupon"> Generate </a>');
    }
})
$(document).on('click', '#generate-coupon', function () {
    var code_input = $('#coupon_code');
    var code = Math.random().toString(36).substr(2, 8);
    code_input.val(code);
});