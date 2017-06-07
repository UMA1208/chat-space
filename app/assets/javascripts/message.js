$(function() {
 function buildHTML(message) {
   var html = `<p class= "chat-main__body__message--name">
               ${ message.name }
               </p>
               <p class= "chat-main__body__message--time">
               ${ message.time }
               </p>
               <p class= "chat-main__body__message--content">
               ${ message.body }
               </p>`;
   return html;
 };

 function scrollDown() {
   var height = $('.chat-main__body__message').height()
   $('.chat-main__body').animate({ scrollTop: height }, 500)
 };

 $('.submit').on('click', function(e) {
   e.preventDefault();
   var message = $('.js_send_form').val();

   $.ajax({
     url: './messages',
     type: 'POST',
     data: {
       message: {
         body: message
       }
     },
     dataType: 'json',
   })

   .done(function(data) {
     var html = buildHTML(data);
     $('.chat-main__body__message').append(html);
     $('#new_message')[0].reset();
     scrollDown();
   })
   .fail(function() {
     alert('メッセージを入力してください');
   });
   return false;
 });
});