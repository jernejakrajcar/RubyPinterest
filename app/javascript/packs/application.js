// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
//= require jquery.ui.widget
//=require jquery-fileupload/basic

//= require z.jquery.fileupload

//SCSS
import 'scss/site'
//JS
import('js/site')
//images
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

//= require masonry/jquery.masonry
//= require isotope/jquery.isotope


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
$(window).on('load', function() {
  $('.directUpload').find("input:file").each(function(i, elem) {
    var fileInput = $(elem);
    var form = $(fileInput.parents('form:first'));
    var submitButton = form.find('input[type="submit"]');
    var progressBar = $("<div class='bar'></div>");
    var barContainer = $("<div class='progress'></div>").append(progressBar);
    fileInput.after(barContainer);
    fileInput.fileupload({
      fileInput: fileInput,
      url: form.data('url'),
      type: 'POST',
      autoUpload: true,
      formData: form.data('form-data'),
      paramName: 'file',
      dataType: 'XML',
      replaceFileInput: false,
      progressall: function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        progressBar.css('width', progress + '%')
      },
      start: function (e) {
        submitButton.prop('disabled', true);

        progressBar.
           css('background', 'green').
           css('display', 'block').
           css('width', '0%').
           text("Loading...");
       },
         done: function(e, data) {
           submitButton.prop('disabled', false);
           progressBar.text("Uploading done");

           var key = $(data.jqXHR.responseXML).find("Key").text();
           var url = '//' + form.data('host') + '/' + key;

           var input = $("<input />", { type:'hidden', name: fileInput.attr('name'), value: url })
           form.append(input);
         },
         fail: function(e, data) {
           submitButton.prop('disabled', false);

           progressBar.
             css("background", "red").
             text("Failed");
         }
    });
  });
});

//
//     });
//   });
// });
