$(function() {
  $(".modal-fade-screen, .modal-close").on("click", function() {
    closeModal();
  });

  $(".modal-link").on("click", function() {
    openModal();
  });

  $(".modal-inner").on("click", function(e) {
    e.stopPropagation();
  });

  function closeModal() {
    $('body').removeClass('modal-open')
  }

  function openModal() {
    $('body').addClass('modal-open')
  }
});
