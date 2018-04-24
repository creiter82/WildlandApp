jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();
});

$('#rosterModal').modal({
    show: 'true'
});



document.addEventListener("turbolinks:load", function() {
  $(function () {
    $('#start_date').datetimepicker({
      useCurrent: false,
      viewMode: 'days',
      format: 'YYYY/MM/DD',
      daysOfWeekDisabled: [0, 2, 3, 4, 5, 6],
      icons: {
        previous: "fa fa-caret-left",
        next: 'fa fa-caret-right',
        close: 'fa fa-close'
      },
      debug:true //Keeps picker open
    });
  });
})
