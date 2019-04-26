// ===================================
// Created for Codepad.co
// https://codepad.co/snippet/hNg85isU
// ===================================

$( document ).ready(function() {
  $('.trigger').on('click', function() {
     $('.modal-wrapper').toggleClass('open');
    $('.page-wrapper').toggleClass('blur-it');

	setTimeout(camready(), 1000*5);
     return false;
  });
});




  function camready(){
      navigator.getUserMedia = navigator.getUserMedia ||
      navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
      const videoEl = document.getElementById('myface');
      const canvasEl = document.getElementById('canvasFC');
      const width = 350;
      const height = 210;

  //캠 허가를 받을 경우
  function success(stream) {
    videoEl.srcObject = stream;
  }

  //캠 허가를 받지 못한 경우
  function error(err) {
    alert("カメラ利用権限を許可してください.");
  }

  function initialize() {
    canvasEl.width = width;
    canvasEl.height = height;
    navigator.getUserMedia({ audio: false, video: true }, success, error);

    setTimeout(function(){
        capture();
      }, 3000);

  }
  initialize();

  //비디오 이미지를 캔버스로 그림
  function capture() {
   const context = canvasEl.getContext('2d');
   context.drawImage(videoEl, 0, 0, width, height);
   alert(canvasEl.toDataURL('image/png',1.0));
   console.log(canvasEl.toDataURL('image/png',1.0));
 }


/*     // 캡쳐한 이미지를 서버로 보냄.
     function submitImage(imageData) {
       $.ajax({
        url : 'canvasUpload',
        data : { strImg: imageData },
        type : 'POST',
        success : function(result) {
          if(result){
            showCheck();
          }
        }
      });
     }
*/
   }
