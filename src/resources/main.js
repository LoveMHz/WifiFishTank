$(function() {
    function updateLED(event) {
        var selected_color = event.color.toRGB();

        if($('select.led_mode').val() !== 'EFFECT_CONST' && typeof event.value === 'undefined')
            setMode('EFFECT_CONST');

        $.get('/update', { R: selected_color.r, G: selected_color.g, B: selected_color.b }, proccessUpdate);
    }

    function setMode(mode) {
         $('select.led_mode').val(mode);
         $.get('/update', { mode: mode }, proccessUpdate);
    }

    function proccessUpdate(data) {
      data = $.parseJSON(data);

      $('select.led_mode option').eq(data.mode).prop('selected', true);

      var picker_c = led_colorpicker.data('colorpicker').color.toRGB();
      if(picker_c.r !== data.R || picker_c.g !== data.G || picker_c.b !== data.B)
        led_colorpicker.colorpicker('setValue', 'rgba(' + data.R + ',' + data.G + ',' + data.B + ',1)');
    }

    var led_colorpicker = $('.led_color').colorpicker({
        format: 'hex',
    }).on('changeColor.colorpicker', $.debounce(100, updateLED));

    $('select.led_mode').change(function() {
        setMode($(this).val());

        if($('option:selected', this).data('color')) {
            led_colorpicker.colorpicker('setValue', $('option:selected', this).data('color'));
        }
    });

    window.setInterval(function() {
      $.get('/update', proccessUpdate);
    }, 5000);

    $.get('/update', proccessUpdate);

    $(window).resize(function() {
      $('iframe').attr( 'src', function ( i, val ) { return val; });
    });
});
