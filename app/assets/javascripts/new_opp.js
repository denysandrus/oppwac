
$(document).on('click', '.direction-link', function () {
    if($(this).hasClass('next')) {
    par = '#'+$(this).parents('.opp-block').attr('id');
    allowed = true;
    $(par+' .field input,' + par+' .field textarea,' + par+'  .field select' ).each( function(){
        if($(this).prop('required') && !$(this).val()) {
            allowed = false;
            $(this).addClass('invalid');
        } else {
            $(this).removeClass('invalid');
        }

    });

    if (allowed) {
        $('.warn-status').html('')
        $('.opp-block').hide();
        target = $(this).data('target');
        $(target).fadeIn();
        if (target == '#block5') {
            $('#verify-name').html($('#opportunity_name').val());
            $('#verify-org').html($('#opportunity_organization').val());
            $('#verify-opp-type').html($('#opportunity_opportunity_type_id option:selected').text());
            $('#verify-short-desc').html($('#opportunity_short_description').val());
            $('#verify-opp-country').html($('#opportunity_country option:selected').text());
            $('#verify-city').html($('#opportunity_city').val());
            deadlinevar = $('#opportunity_deadline_1i option:selected').text() + ' '
                + $('#opportunity_deadline_2i option:selected').text()+ ' '
                + $('#opportunity_deadline_3i option:selected').text()+ ' '
                + $('#opportunity_deadline_4i option:selected').text()+ ':'
                + $('#opportunity_deadline_5i option:selected').text();
            $('#verify-deadline').html(deadlinevar);
            $('#verify-age-min').html($('#opportunity_age_min').val());
            $('#verify-age-max').html($('#opportunity_age_max').val());
            $('#verify-residence').html($('#opportunity_residence option:selected').text());
            $('#verify-nationality').html($('#opportunity_nationality   option:selected').text());
            $('#verify-education').html($('#opportunity_education_id option:selected').text());
            $('#verify-language').html($('#opportunity_language option:selected').text());
            $('#verify-cost').html($('#opportunity_cost_id option:selected').text());
            $('#verify-long-description').html($('#opportunity_long_description').val());
            $('#verify-requirements').html($('#opportunity_requirements_to_apply').val());
            $('#verify-award').html($('#opportunity_award').val());
            $('#verify-limitations').html($('#opportunity_limitations').val());
            $('#verify-preferences').html($('#opportunity_preferences').val());
            $('#verify-website').html($('#opportunity_website').val()).attr("href", $('#opportunity_website').val());
            $('#verify-link').html($('#opportunity_link_to_apply').val());
        }
    } else {
        $('.warn-status').html('Some required fields are empty')
    }
    } else {
        $('.warn-status').html('')
        $('.opp-block').hide();
        target = $(this).data('target');
        $(target).fadeIn();
    }

});

$(document).on('click','.block-toggle', function(){
    target = $(this).data('target');
        if ($(target).hasClass('stealth')){
            $(target).removeClass('stealth');
            $(target).slideDown('slow');
            if($(this).hasClass('not-possible')){
            $(this).removeClass('not-possible');
            $(this).addClass('possible');
            } else {
                $(this).addClass('not-possible');
                $(this).removeClass('possible');
            }
        } else {
            $(target).addClass('stealth');
            $(target).slideUp('slow');
            $(this).addClass('possible');
            $(this).removeClass('not-possible')
        }

});


$( document).on( 'change','#opportunity_picture' , function( e )
{
    function displayPreview(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#verify-image').css({'background-image' : 'url(' + e.target.result + ')' });
                console.log(e.target.result)

            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    displayPreview(this);
});