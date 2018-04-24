jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();
});

$('#imagesModal').modal({
    show: 'true'
});

function previewFeatureImage() {
  var preview = document.querySelector('#feature_prev');
  var file    = document.querySelector('input[type=file]').files[0];
  var reader  = new FileReader();

  reader.addEventListener("load", function () {
    preview.src = reader.result;
  }, false);

  if (file) {
    reader.readAsDataURL(file);
  }
};

// function previewImages() {

//   var preview = document.querySelector('#preview');
//   var files   = document.querySelector('input[type=file]').files;

//   function readAndPreview(file) {

//     // Make sure `file.name` matches our extensions criteria
//     if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
//       var reader = new FileReader();

//       reader.addEventListener("load", function () {
//         var image = new Image();
//         image.height = 100;
//         image.title = file.name;
//         image.src = this.result;
//         preview.appendChild( image );
//       }, false);

//       reader.readAsDataURL(file);
//     }

//   }

//   if (files) {
//     [].forEach.call(files, readAndPreview);
//   }

// };

// window.onload = function() {
//   // Check for File API support.
//   if (window.File && window.FileList && window.FileReader) {
//     var filesInput = document.getElementById('deployment_images');
//     filesInput.addEventListener('change', function(e) {
//       var output = document.getElementById('preview');
//       var files = e.target.files; //FileList object
      
//       output.innerHTML = ''; // Clear (previous) results.
      
//       for (var i = 0; i < files.length; i++) {
//         var currFile = files[i];
//         if (!currFile.type.match('image')) continue; // Skip non-images.
        
//         var imgReader = new FileReader();
//         imgReader.fileName = currFile.name;
//         imgReader.addEventListener('load', function(e1) {
//           var img = e1.target;
//           var div = document.createElement('div');
//           div.className = 'col-md-2';
//           div.innerHTML = [
//             '<img src="' + img.result + '"' + 'title="' + img.fileName + '"' + 'style="' + 'width:100%;' + '"' + 'class="' + 'img-thumbnail' + '"/>',
//             // '<label class="caption">' + img.fileName + '</label>'
//           // ].join('');
//           ];
//           output.appendChild(div);
//         });

//         // Read image.
//         imgReader.readAsDataURL(currFile);
//       }
//     });
//   } else {
//     console.log('Your browser does not support File API!');
//   }
// }

// function previewImages() {

//   var preview = document.querySelector('#preview');
  
//   if (this.files) {
//     [].forEach.call(this.files, readAndPreview);
//   }

//   function readAndPreview(file) {

//     // Make sure `file.name` matches our extensions criteria
//     if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
//       return alert(file.name + " is not an image");
//     } // else...
    
//     var reader = new FileReader();
    
//     reader.addEventListener("load", function() {
//       var image = new Image();
//       image.height = 100;
//       image.title  = file.name;
//       image.src    = this.result;
//       preview.appendChild(image);
//     }, false);
    
//     reader.readAsDataURL(file);
    
//   }

// }

// document.querySelector('#deployment_images').addEventListener("change", previewImages, false);



