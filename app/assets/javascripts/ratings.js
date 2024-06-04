$(document).ready(function() {
    function getCsrfToken() {
      return $('meta[name="csrf-token"]').attr('content');
    }
  
    $('#theme-form').on('submit', function(e) {
      e.preventDefault();
      var themeId = $('#theme_id').val();
      $.ajax({
        url: '/load_image',
        method: 'GET',
        data: { theme_id: themeId },
        success: function(data) {
          $('#current-image').attr('src', data.image_url);
          $('#current-image').data('image-id', data.image_id);
          $('#image-id').text(data.image_id);
          $('#average-rating').text(data.ave_value);
        },
        error: function(xhr, status, error) {
          console.error('Error loading image:', error);
        }
      });
    });
  
    $('#prev-image').on('click', function() {
      var themeId = $('#theme_id').val();
      var currentImageId = $('#current-image').data('image-id');
      $.ajax({
        url: '/prev_image',
        method: 'GET',
        data: { theme_id: themeId, current_image_id: currentImageId },
        success: function(data) {
          $('#current-image').attr('src', data.image_url);
          $('#current-image').data('image-id', data.image_id);
          $('#image-id').text(data.image_id);
          $('#average-rating').text(data.ave_value);
        },
        error: function(xhr, status, error) {
          console.error('Error loading previous image:', error);
        }
      });
    });
  
    $('#next-image').on('click', function() {
      var themeId = $('#theme_id').val();
      var currentImageId = $('#current-image').data('image-id');
      $.ajax({
        url: '/next_image',
        method: 'GET',
        data: { theme_id: themeId, current_image_id: currentImageId },
        success: function(data) {
          $('#current-image').attr('src', data.image_url);
          $('#current-image').data('image-id', data.image_id);
          $('#image-id').text(data.image_id);
          $('#average-rating').text(data.ave_value);
        },
        error: function(xhr, status, error) {
          console.error('Error loading next image:', error);
        }
      });
    });
  
    $('#rate-form').on('submit', function(e) {
      e.preventDefault();
      var rating = $('#rate-form #value').val();
      var imageId = $('#current-image').data('image-id');
      $.ajax({
        url: '/rate_image',
        method: 'POST',
        headers: {
          'X-CSRF-Token': getCsrfToken()
        },
        data: { image_id: imageId, value: rating },
        success: function(data) {
          alert('Rating submitted!');
          $('#average-rating').text(data.ave_value);
        },
        error: function(xhr, status, error) {
          console.error('Error submitting rating:', error);
        }
      });
    });
  });
  