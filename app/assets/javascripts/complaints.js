$(function () {
    $.ajax({
        url: '/organization_units/load_tree',
        success: function(response){
            $('#complaint_tree').treeview({
                data: response,
                levels: 1,
                onNodeSelected: function (event, data) {
                    $.ajax({
                        url:'/complaints/load_complaints',
                        data: { node: data.id},
                        success: function (response) {
                            $('#complaints').html(response)
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

    $("#complaint-rating").raty({
        path: "/assets/",
        scoreName: "complaint_client_satisfaction[rating]",
        number: 10
    });

    $(".complaint-rating-review").raty({
        readOnly: true,
        score: function() {
            return $(this).attr("data-score");
        },
        path: "/assets/",
        number: 10
    });

});