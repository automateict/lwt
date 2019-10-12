$(function () {
    $.ajax({
        url: '/organization_units/load_tree',
        success: function(response){
            $('#petition_tree').treeview({
                data: response,
                levels: 1,
                onNodeSelected: function (event, data) {
                    $.ajax({
                        url:'/petitions/load_petitions',
                        data: { node: data.id},
                        success: function (response) {
                            $('#petitions').html(response)
                            $('.js-exportable').DataTable({
                                dom: 'lrBfrtip',
                                responsive: true,
                                buttons: [
                                    'copy', 'csv', 'excel', 'pdf', 'print'
                                ]
                            });
                        }
                    })
                }
            });
        }
    });

    $(function () {
        $.ajax({
            url: '/organization_units/load_tree',
            success: function(response){
                $('#petition_report_organization_unit_tree').treeview({
                    data: response,
                    levels: 2,
                    onNodeSelected: function (event, data) {
                        $('#report_organization_unit').val(data.id)
                    }
                });
            }
        });

    });

    $(function () {
        $.ajax({
            url: '/organization_units/load_tree',
            success: function(response){
                $('#complaint_report_organization_unit_tree').treeview({
                    data: response,
                    levels: 2,
                    onNodeSelected: function (event, data) {
                        $('#report_organization_unit').val(data.id)
                    }
                });
            }
        });

    });

});