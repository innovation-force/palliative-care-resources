// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require select2
//= require_tree .

$(function() {
  $(".select2-rails").select2();

  $("#resource_provider_id").select2({
    placeholder: "Select a provider",
    allowClear: true
  });

  $("#resource_tag_ids").select2({
    placeholder: "Select a tag(s)",
    allowClear: true
  });
});

$(function () {
  var searchBar = $("#tag_ids");
  searchBar.select2({
    placeholder: "Search CareLibrary"
  });
  searchBar.on("change", function (event) {
    $(this).closest("form").submit();
  });
});

var chart = c3.generate({
  bindto: '#chart',
  data: {
    columns: [
      ['data1', 30, 200, 100, 400, 150, 250],
      ['data2', 50, 20, 10, 40, 15, 25]
    ],
    types: {
      data1: 'bar',
    }
  },
  axis: {
    rotated: true
  }
});
