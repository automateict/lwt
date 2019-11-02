(function ($) {
    'use strict';
    $(function ($) {
        //iCheck init
        $('input[type="checkbox"]').iCheck({
            checkboxClass: 'icheckbox_square-blue',
        });

        $('input[type="radio"]').iCheck({
            radioClass: 'iradio_square-blue'
        });

        $('.js-dtp').each(function (i, key) {
            var format = $(key).data('format');
            $(key).datetimepicker({
                format: format,
                showClear: true
            });
        });

        $('.wysihtml5').wysihtml5({'toolbar': {'blockquote': true, 'html': true}})

        $( "#accordion" ).accordion({
            collapsible: true
        });

        $( "select" ).select2({
            theme: "bootstrap"
        });

        $('.js-exportable').DataTable({
            responsive: true,
            dom: '<"html5buttons"B>lTfgtip',
            buttons: ['copy', 'csv', 'excel', 'pdf', 'print']
        });

    });
}(jQuery))