$(function(){
  function buildHTML(post) {
    image = (post.image) ? `<img class="post__content--image" src="${post.image}" >` : ""; //三項演算子を使ってmessage.imageにtrueならHTML要素、faiseなら空の値を代入。
    if (post.category === 10) {
      var html = `
      <div class="post" data-id="${post.id}">
        <div class="post__wrapper">
          <div class="post__create">
            ${post.created_at}
          </div>
          <div class="post__content">
            <p class="post__content--text">
              ${post.content}
            </p>
              ${image}
          </div>
        </div>
      </div>`
    
    }else {
        var html = `
        <div class="post" data-id="${post.id}">
          <div class="post__wrapper">
            <div class="post__create">
              ${post.created_at}
            </div>
            <div class="post__content">
              <p class="post__content--text">
                ${post.content}
              </p>
                ${image}
            </div>
          </div>
          <div class="post__edit">
            <a href="/users/${post.user_id}/categories/${post.category}/posts/${post.id}/edit">編集と削除</a>
          </div>
        </div>`
      };
      return html;
    };


  $('.new_post').on('submit', function(e){
    e.preventDefault()
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(post){
      var html = buildHTML(post);
      $('.posts').append(html);
      $('.posts').animate({ scrollTop: $('.posts')[0].scrollHeight});
      $('form')[0].reset();
      $('.form__submit-btn').prop('disabled', false);
    })
    .fail(function(){
          alert("メッセージ送信に失敗しました");
    });
  });
})
