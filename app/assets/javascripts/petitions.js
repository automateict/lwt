$(function () {
    $.ajax({
        url: '/organization_units/load_petition_tree',
        success: function(response){
            $('#petition_organization_tree').treeview({
                data: response,
                levels: 2,
                onNodeSelected: function (event, data) {
                    $('#petition_organization_unit_id').val(data.id)
                }
            });
        }
    });

});