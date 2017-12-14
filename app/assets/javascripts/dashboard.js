// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

var ready = function () {

    if ($(".pages-block").length > 0) {
        $(".dashboard-opportunities").onepage_scroll({
            sectionContainer: "section",     // sectionContainer accepts any kind of selector in case you don't want to use section
            easing: "ease",                  // Easing options accepts the CSS3 easing animation such "ease", "linear", "ease-in",
            loop: false,                     // You can have the page loop back to the top/bottom when the user navigates at up/down on the first/last page.
            direction: "vertical"            // You can now define the direction of the One Page Scroll animation. Options available are "vertical" and "horizontal". The default value is "vertical".
        });
    } else {
        $(".dashboard-opportunities").onepage_scroll({
            responsiveFallback: true         // You can fallback to normal page scroll by defining the width of the browser in which
        });
    }

    //Calculate meteors/comets position
    $(".meteor-wrapper").each(function (i) {
        var timeLeft = $(this).attr("data-deadline");
        var deadlineYear = +(timeLeft[4] + timeLeft[5] + timeLeft[6] + timeLeft[7]);
        var deadlineMonth = +(timeLeft[2] + timeLeft[3]);
        var deadlineDay = +(timeLeft[0] + timeLeft[1]);

        var cell_date = new Date(deadlineYear, deadlineMonth - 1, deadlineDay); // месяцы 0-11, дни 1-31
        var today = new Date();

        var diffTime = Math.abs(today.getTime() - cell_date.getTime());
        var diffDays = Math.ceil(diffTime / (1000 * 3600 * 24)); // в большую сторону

        if (diffDays > 1 && (today.getTime() - cell_date.getTime()) > 0) {
            $(this).find(".meteor").removeClass("meteor").addClass("comet");
            $(this).removeClass("meteor-wrapper").addClass("comet-wrapper");
        }


        var top = 0;
        var left = 0;
        if ($(this).hasClass("meteor-wrapper")) {
            //days 1, 2, 3, ... , 6, 7
            if (diffDays >= 1 && diffDays <= 7) {
                $(this).appendTo(".one");
                top = Math.round(Math.random() * 350) + "px";
                left = 395 + diffDays * 75 + "px"; //470
            }
            //weeks 1, 2, 3, 4
            if (diffDays >= 8 && diffDays <= 28) {
                $(this).appendTo(".two");
                top = Math.round(Math.random() * 400) + "px";
                left = 280 + diffDays / 7 * 160 + "px";
            }

            //month 1, 2, 3
            if (diffDays >= 29 && diffDays <= 90) {
                $(this).appendTo(".three");
                top = Math.round(Math.random() * 400) + "px";
                left = 270 + diffDays / 28 * 200 + "px";
            }
            $(this).css({
                'top': top,
                'left': left,
                'display': 'inline-block'
            });
        }

        if ($(this).hasClass("comet-wrapper")) {
            //top = Math.round(Math.random() * 250) - 200 + "px";
            top = Math.round(Math.random() * 250) + 100 + "px";
            left = 600 + -diffDays * 300 + "px";

            $(this).css({
                'top': top,
                'left': left,
                'display': 'inline-block',
                'position': 'fixed'
            });
        }
    });


    // applied opps position
    var divs = document.getElementsByClassName('applied');
    var delta = Math.PI * 2 / divs.length;
    var x = 140, y = 140, angle = 0;

    for (var i = 0; i < divs.length; i++) {
        divs[i].style.position = 'absolute';
        divs[i].style.left = x * Math.cos(angle) + 'px';
        divs[i].style.top = y * Math.sin(angle) + 'px';
        divs[i].style.display = 'block';
        angle += delta;
    }

    /**
     * Opportunity image
     */
    $("#opportunity_image").load(function () {
        var width = $(this).width();
        var height = $(this).height();
        if (width > height) {
            $(this).css("height", "350");
        } else {
            $(this).css("width", "350");
        }
    });
};

/**
 * Bind events
 */
$(document).ready(ready);
$(document).on('page:load', ready);

$(document).on('click', '.meteor', function (evt) {
    evt.preventDefault();
    var current_rollover = $(this).next('.rollover');
    var rollovers = $(".meteor-wrapper .rollover");
    rollovers.not(current_rollover).slideUp();

    if (current_rollover.is(':hidden')) {
        current_rollover.slideDown();
    } else {
        current_rollover.slideUp();
    }
});

$(document).on('click', function (e) {
    var meteors = $(".meteor-wrapper");
    if (meteors.find(e.target).length === 0) {
        meteors.find('.rollover').not(':hidden').slideUp();
    }

    var comets = $(".comet-wrapper");
    if (comets.find(e.target).length === 0) {
        comets.find('.rollover').not(':hidden').slideUp();
    }
});

$(document).on('click', '.comet', function (e) {
    var current_rollover = $(this).next('.rollover');
    var rollovers = $(".comet-wrapper .rollover");
    rollovers.not(current_rollover).slideUp();

    if (current_rollover.is(':hidden')) {
        current_rollover.slideDown();
    } else {
        current_rollover.slideUp();
    }
});


/**
 * welcome page
 */
$(document).on('submit', '.email-form', function (e) {
    var me = $(this);

    var inputEmail = me.find(".email");
    var inputPassword = me.find(".password");
    var inputSubmit = me.find(".submit");
    var notices = $(".notice");

    if (inputEmail.hasClass('verified')) {
        return true;
    }

    e.preventDefault();

    if (inputSubmit.filter('[clicked=true]').hasClass('retry-login')) {
        inputSubmit.filter('.participate-in-beta').removeClass('participate-in-beta').val('Next');
        inputSubmit.filter('.retry-login').remove();
        inputEmail.val('').show();
        notices.html('');
        return false;
    }

    if (inputSubmit.hasClass('participate-in-beta')) {
        $.ajax({
            url: "/auth/participate_in_beta",
            type: 'POST',
            data: {email: inputEmail.val()},
            success: function (response) {
                if (response.success) {
                    inputSubmit.hide();
                    notices.html('Thank you! We will review your request and send you an invitation then.');
                }
            }
        });
    } else {
        $.ajax({
            url: "/auth/check_email",
            type: 'POST',
            data: {email: inputEmail.val()},
            success: function (response) {
                if (response.success) {
                    inputEmail.addClass('verified').hide();
                    inputPassword.show();
                    inputSubmit.val("Log in");
                }
                else if ($('.participate-in-beta').length && $('.enter-promo').length && $('.retry-login').length) {
                    inputSubmit.addClass('participate-in-beta').val('Yes');
                    $('.enter-promo').show();
                    $('.retry-login').show();
                }
                else {
                    inputEmail.hide();
                    notices.html('Sorry, we\'re in private beta and you are not in the list yet.<br />Do you want to participate?');
                    inputSubmit.clone().addClass('enter-promo').val('Yes and I have a code').appendTo(".email-form");
                    inputSubmit.addClass('participate-in-beta').val('Yes');
                    inputSubmit.clone().addClass('retry-login').val('Retry login').appendTo(".email-form");
                }

            }
        });
    }
});

$(document).on('click', '.enter-promo', function (event) {
    event.preventDefault();
    $('.email-form').slideToggle();
    $('.coupon-form').slideToggle();
    $(".notice").html('');
});
$(document).on('click', '.retry-login', function (event) {
    $('.participate-in-beta').val("Next").removeClass('participate-in-beta');
    $('.enter-promo').hide();
    $('.retry-login').hide();
});
$(document).on('submit', '.coupon-form', function (e) {
    e.preventDefault();
    var notices = $(".notice");
    var coupon = $('#user_coupon').val();
    $.ajax({
        url: "/auth/check_coupon",
        type: 'POST',
        data: {coupon: coupon},
        success: function (response) {
            if (response.success) {
                window.location.assign('/sign_up?coupon=' + coupon);
            } else if (response.error) {
                notices.html('Promo code is invalid');
            }
        }
    });
});


$(document).on('submit', '#new_user', function () {
    var coupon = $('#coupon').val();
    $.ajax({
        url: "/auth/redeem_coupon",
        type: 'POST',
        data: {coupon: coupon}
    });
});
/**
 * Helper: binding event on form submit to check what button was clicked
 */
$(document).on('click', '.email-form input[type=submit]', function () {
    $("input[type=submit]", $(this).parents("form")).removeAttr("clicked");
    $(this).attr("clicked", "true");
});

// Opportunity page
$(document).on('click', '.toggle-watchlist', function (e) {
    e.preventDefault();

    var me = $(this);
    var opportunity_id = me.attr('data-id');

    $.ajax({
        url: "/opportunities/change_in_watchlist",
        type: 'POST',
        data: {opportunity_id: opportunity_id},
        success: function (response) {
            if (response.success) {
                me.toggleClass('added');
            }
        }
    });
});




