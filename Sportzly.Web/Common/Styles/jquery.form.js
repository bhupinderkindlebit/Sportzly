$(document).ready(function () {
    $.formValid();
    $.fieldFile();
    $.fieldHref();
    $.fieldDatePicker();
    $.clickSubmit();
    $.fieldSubmit();
    $.fieldHref();
});

jQuery.clickSubmit = function () {
    $('.click-submit').each(function () { $(this).addClass('click'); });
    $('body').on('click', '.click-submit', function () { $(this).parents('form').submit(); });
}

jQuery.fieldSubmit = function () { $('body').on('change', 'select.field-submit', function () { $(this).parents('form').submit(); }); }

jQuery.fieldHref = function () { $('select.field-href').change(function () { window.location = $(this).children('option:selected').val(); }); }

jQuery.fieldDatePicker = function () { $('.field-datepicker').datepicker({ dateFormat: 'dd-mm-yy' }); }

jQuery.fieldFile = function () {
    $('input.field-file').each(function () {
        $(this).wrap('<div class="field field-file"></div>');
        var $valid = "";
        if ($(this).is('.valid-image')) { $valid = 'valid-image'; $(this).removeClass('valid-image'); }
        $(this).parent('div.field-file').append('<input class="field field-text xnarrow  ' + $valid + '" type="text" value="Browse . . ." /><input class="button button-image color weak button-browse" type="button" value="browse" />');
        $('body').on('change', 'input.field-file', function () { var $text = $(this).siblings('input.field.text'); if ($(this).val()) { $text.val($(this).val()); } else { $text.val('Browse . . .'); } });
    });
}

jQuery.formValid = function () {
    $('body').on('click', 'input[type=submit]', function () { $('input[type=submit]').removeAttr('click'); $(this).attr('click', 'true'); });
    $('body').on('submit', 'form', function () {
        var $submit = $(this).find('input[type="submit"]');
        $submit.attr('disabled', 'disabled');
        $(this).find('.cell-error-checkbox').remove();
        $(this).find('.cell-error p').remove();
        $(this).find('.cell-error').contents().unwrap();
        var $field = $(this).find('input, select, textarea, .valid-checkbox');
        var $valid = true;
        $field.each(function () {
            var $error = false;
            var $value = $(this).val();
            if ($(this).is('.valid-checkbox') && !$(this).fieldValid('CHECKBOX')) { $error = 'Select option'; }
            else if ($(this).is('.valid-required') && !$(this).fieldValid('REQUIRED')) { $error = 'Required'; }
            else if ($(this).is('.valid-email') && !$(this).fieldValid('EMAIL')) { $error = 'Invalid email'; }
            else if ($(this).is('.valid-password') && !$(this).fieldValid('PASSWORD')) { $error = 'Invalid password'; } //8+ (a-z, 0-9 -)
            else if ($(this).is('.valid-url') && !$(this).fieldValid('URL')) { $error = 'Invalid URL'; }
            else if ($(this).is('.valid-word') && !$(this).fieldValid('WORD')) { $error = 'Invalid word - letters only'; }
            else if ($(this).is('.valid-string') && !$(this).fieldValid('STRING')) { $error = 'Invalid string - letters &amp; numbers only'; }
            else if ($(this).is('.valid-num') && !$(this).fieldValid('NUM')) { $error = 'Invalid number'; }
            else if ($(this).is('.valid-length') && !$(this).fieldValid('LENGTH')) { $error = 'Must be ' + $(this).attr("lengthtxt") + ' characters'; }
            else if ($(this).is('.valid-int') && !$(this).fieldValid('INT')) { $error = 'Invalid integer'; }
            else if ($(this).is('.valid-decimal') && !$(this).fieldValid('DECIMAL')) { $error = 'Invalid decimal'; }
            else if ($(this).is('.valid-match') && !$(this).fieldValid('MATCH')) { $error = 'Typing error'; }
            if ($error) {
                if ($(this).data('error')) { $error = $(this).data('error'); }
                var $target = $(this);
                if ($(this).is('.field-autocomplete')) { $target = $(this).prev('.field-autocomplete'); }
                if ($(this).is('.valid-checkbox')) { $target.after('<span class="cell cell-error cell-error-checkbox"><p>' + $error + '</p></span>'); }
                else { $target.wrap('<span class="cell cell-error ' + $(this).attr('class') + '"></span>'); $target.after('<p>' + $error + '</p>'); }
                $valid = false; //stop submit
            }
        });
        
        if ($valid) {
            var $click = $(this).find('input[type=submit][click=true]');
            $(this).append('<input type="hidden" name="' + $click.attr('name') + '" value="' + $click.val() + '" />');
        }
        else {
            $submit.removeAttr('disabled');
            var $first = $('.cell-error').eq(0);
            if ($first.hasClass('cell-error-checkbox')) { $first = $first.prev('.valid-checkbox'); }
            $('html, body').animate({ scrollTop: $first.eq(0).offset().top }, 'slow');
            $(window).trigger('resize');
        }
        $('body').find('input[type=submit]').removeAttr('click').removeAttr('disabled');
        return $valid;
    });
}

jQuery.fn.fieldValid = function ($type) {
    var $value = $(this).val();
    if ($type == 'CHECKBOX' && !$(this).find('input:checked').length) { return false; }
    if ($type == 'REQUIRED' && !$value) { return false; }
    else if ($type == 'EMAIL' && $value) { var $pattern = /^[\w.+-]+@[\w.-]+\.[a-z]{2,6}$/i; return $pattern.test($value); }
    else if ($type == 'PASSWORD') { var $pattern = /^[\w-]{8,80}$/; return $pattern.test($value); }
    else if ($type == 'MATCH') { var $match = $('#' + $(this).data('match')).val(); if ($value == $match) { return true; } else { return false; } }
    else if ($type == 'URL' && $value) { if ($value.substr(0, 4) == 'www.') { $value = 'http://' + $value; } var $pattern = /^(http|https):\/\/[\w-.]+[\w.]{2,6}/; return $pattern.test($value); }
    else if ($type == 'WORD') { var $pattern = /^[a-z]+$/i; return $pattern.test($value); }
    else if ($type == 'STRING') { var $pattern = /^[a-z0-9]+$/i; return $pattern.test($value); }
    else if ($type == 'NUM' && $value && isNaN(parseInt($value))) { return false; }
    else if ($type == 'LENGTH' && $value && $(this).val().length != $(this).attr("lengthtxt")) { return false; }
    else if ($type == 'INT' && ($value && isNaN(parseInt($value)) || $value != Math.round($value))) { return false; }
    else if ($type == 'DECIMAL' && ($value && isNaN(parseInt($value)) || !(/^\d+\.?\d$/.test($value)))) { return false; }
    else { return true; }
}


function checkform(id) {


    $(id).find('.cell-error-checkbox').remove();
    $(id).find('.cell-error p').remove();
    $(id).find('.cell-error').contents().unwrap();
    var $field = $(id).find('input, select, textarea, .valid-checkbox');
  
    var $valid = true;
    $field.each(function () {
        var $error = false;
        var $value = $(this).val();
        if ($(this).is('.valid-checkbox') && !$(this).fieldValid('CHECKBOX')) { $error = 'Select option'; }
        else if ($(this).is('.valid-required') && !$(this).fieldValid('REQUIRED')) { $error = 'Required'; }
        else if ($(this).is('.valid-email') && !$(this).fieldValid('EMAIL')) { $error = 'Invalid email'; }
        else if ($(this).is('.valid-password') && !$(this).fieldValid('PASSWORD')) { $error = 'Invalid password'; } //8+ (a-z, 0-9 -)
        else if ($(this).is('.valid-url') && !$(this).fieldValid('URL')) { $error = 'Invalid URL'; }
        else if ($(this).is('.valid-word') && !$(this).fieldValid('WORD')) { $error = 'Invalid word - letters only'; }
        else if ($(this).is('.valid-string') && !$(this).fieldValid('STRING')) { $error = 'Invalid string - letters &amp; numbers only'; }
        else if ($(this).is('.valid-num') && !$(this).fieldValid('NUM')) { $error = 'Invalid number'; }
        else if ($(this).is('.valid-int') && !$(this).fieldValid('INT')) { $error = 'Invalid integer'; }
        else if ($(this).is('.valid-decimal') && !$(this).fieldValid('DECIMAL')) { $error = 'Invalid decimal'; }
        else if ($(this).is('.valid-match') && !$(this).fieldValid('MATCH')) { $error = 'Typing error'; }
        if ($error) {
            if ($(this).data('error')) { $error = $(this).data('error'); }
            var $target = $(this);
            if ($(this).is('.field-autocomplete')) { $target = $(this).prev('.field-autocomplete'); }
            if ($(this).is('.valid-checkbox')) { $target.after('<span class="cell cell-error cell-error-checkbox"><p>' + $error + '</p></span>'); }
            else { $target.wrap('<span class="cell cell-error ' + $(this).attr('class') + '"></span>'); $target.after('<p>' + $error + '</p>'); }
            $valid = false; //stop submit
        }
    });
    
    if ($valid) {
        var $click = $(id).find('input[type=submit][click=true]');
        $(id).append('<input type="hidden" name="' + $click.attr('name') + '" value="' + $click.val() + '" />');
    }
    else {
       // $submit.removeAttr('disabled');
        var $first = $('.cell-error').eq(0);
        if ($first.hasClass('cell-error-checkbox')) { $first = $first.prev('.valid-checkbox'); }
        $('html, body').animate({ scrollTop: $first.eq(0).offset().top }, 'slow');
        $(window).trigger('resize');
    }
    
    return $valid;

}

