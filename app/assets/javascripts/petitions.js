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

});