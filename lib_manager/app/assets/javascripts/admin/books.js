$("#book_picture").bind("change", function() {
  var size_in_megabytes = this.files[0].size/1024/1024;
  if (size_in_megabytes > 3) {
    alert("Maximum file size is 3MB. Please choose a smaller file.");
  }
});
