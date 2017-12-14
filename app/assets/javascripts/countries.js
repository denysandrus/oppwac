$(document).on('click', '.countries-block .blocks>li>span', function(){
    countries = $(this).parent().data('countries');
    countries_array = $('#data-countries').data(countries);

    if($(this).parent().hasClass('active')) {
        $('.stealth-country').val('');
    } else {
        target = $(this).parent().parent().find('.stealth-country');
        $.each(countries_array, function (index, value) {
            target.val(target.val() + ', '+value.code);
        });
    }
    $(this).parent().toggleClass('active');
    $(this).parent().find('.block-countries').toggle();
});
$(document).on('click', '.block-countries>li', function(){
    country = ', ' + $(this).data('country');
    target = $(this).parent().parent().find('.stealth-country');

    if($(this).hasClass('active')) {
        str = target.val();
        str = str.replace(country,'');
        target.val(str);
    } else {
     target.val(target.val() + country);
    }
    $(this).toggleClass('active');
});
