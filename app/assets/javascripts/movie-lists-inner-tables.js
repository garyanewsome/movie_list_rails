window.movieListsTables = function(table, selector){
  return {
    initializeRows: function(){
      var rowIds = jQuery(selector + ' tbody tr').map(function(){
        return jQuery(this).attr('id')
      });

      for(var i = 0; i < rowIds.length; i++){
        var rowId = rowIds[i]
        var tr = $("#"+rowId);
        var row = table.row(tr);
        row.child($(".inner-tables ." + rowId).html())
      }
    },
    registerDataTableViewChange: function(){
      var self = this;
      $(selector).on( 'page.dt search.dt', function(){
        $(selector).on( 'draw.dt', self.listenForDrawOnce.bind(self))
      })
    },
    registerOpenCloseDetail: function(){
      $(selector + ' tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row(tr);
        if (row.child.isShown()) {
          row.child.hide();
          tr.removeClass('shown');
        }
        else {
          row.child.show();
          tr.addClass('shown');
        }
      });
    },
    listenForDrawOnce: function(){
      this.initializeRows()
      $(selector).off('draw.dt', this.listenForDrawOnce)
    }
  }
}
