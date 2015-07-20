$(function () {
  var searchBar = $("#tag_ids");
  searchBar.select2({
    placeholder: "Search CareLibrary"
  });
  searchBar.on("change", function (event) {
    $(this).closest("form").submit();
  });
});
