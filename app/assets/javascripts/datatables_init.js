jQuery(function(){
  jQuery('#dt-movie').DataTable({
    mark: true
  })

  jQuery(function() {
    var table = jQuery('#dt-movie-lists').DataTable( {
      mark: true,
      "paging": true,
      "lengthChange": false,
      "searching": true,
      "ordering": true,
      "order": [[ 1, "asc" ]],
      "info": true,
      "autoWidth": true
    })

    var movieListsTablesHelper = movieListsTables(table, '#dt-movie-lists')
    movieListsTablesHelper.initializeRows()
    movieListsTablesHelper.registerDataTableViewChange()
    movieListsTablesHelper.registerOpenCloseDetail()
  })
})
