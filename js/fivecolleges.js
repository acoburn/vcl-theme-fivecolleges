(function($, vcl) {
  $(function(){
      reservations();
      computerTableColors();
      loginPage();
      navigation();
  });

  function require(name, cb) {
    $.ajax({
      url: 'themes/' + vcl.theme + '/js/' + name,
      dataType: 'script',
      cache: 'true',
      success: function (data, status, xhr) {
        if (typeof cb === "function") {
          cb(data, status, xhr);
        }
      }
    });
  }
  
  function navigation() {
    $('a.vcl-help').on('click', function () {
      $('#vcl-help').modal();
      if(typeof(Backbone) == "undefined"){
        require('underscore-min.js', function () {
          require('backbone-min.js', function () {
            require('help.js');
          });
        });
      }
      return false;
    });
  }

  function loginPage() {
    $('a.vcl-institution').hover(function () {
      $(this).find('img').removeClass('vcl-institution-nohover');
      $(this).find('img').addClass('btn');
    }, function () {
      $(this).find('img').addClass('vcl-institution-nohover');
      $(this).find('img').removeClass('btn'); 
    });
  }

  function reservations(){
    $('.scriptonly').show();
    var screenSelected = undefined;
    if($('#content > h2').html() == 'Connect!'){
      
      // Display os-specific instructions
      if (navigator.userAgent.match(/OS X/)) {
        $('.vcl-osx-instructions').show();
      } else if (navigator.userAgent.match(/Windows/)) {
        $('.vcl-windows-instructions').show();
      } else {
        $('.vcl-linux-instructions').show();
      }

      // Handle rdp connection events
      if ($('#vcl-rdp-connection').length) {

          // Shuffle some DOM elements around
          $('#vcl-rdp-connection').html($('#connectdiv').html());
          $('#connectdiv').remove();
          $('#counterdiv').remove();

          // Setup the screen-size menu
          if(vcl.preferredSize[0] == 0) {
            $('#vcl-screen-size').val('fullscreen');
          } else {
            $('option', '#vcl-screen-size').each(function () {
              var matches = $(this).val().split('x');
              if (matches.length == 2) {
                var w = parseInt(matches[0])
                  , h = parseInt(matches[1])
                  ;
                if (vcl.preferredSize[0] >= w && vcl.preferredSize[1] >= h && screenSelected === undefined) {
                  screenSelected = true;
                  $('#vcl-screen-size').val($(this).val());
                }
              }
            });
          }

          // Setup the connect button
          $('.connection a.connect').on('click', function () {
            var screen = $('option:selected', '#vcl-screen-size').val()
              , dim = screen.split(/x/i)
              , uri = ''
              , params = {
                  forwardDisks: 'yes',
                  forwardPrinters: 'yes',
                  forwardSerial: 'yes',
                  forwardAudio: 'yes',
                  drawDesktop: 'yes',
                  title: 'VCL%20Reservation'
                }
                ;
            if (screen == 'fullscreen') {
              params.fullscreen = 'yes';
            } else if (dim.length == 2) {
              params.screenWidth = dim[0];
              params.screenHeight = dim[1];
            }
            uri = 'rdp://' + $(this).data('username') +
                       ':' + $(this).data('password') + 
                       '@' + $(this).data('ipaddr') +
                       '?' + $.map(params, function (v, k) {
                          return k + '=' + v;
                        }).join('&');
            window.location.href = uri;
            return false;
          });
      } else {
        $('input.ssh-cmd', '#content').focus().select();
      }
    }
  }

  function computerTableColors(){
    if($('#content > form#utilform > table#layouttable')){
      $('tr', '#content > form#utilform > table#layouttable').each(function(){
        var item = $(this).children('td:nth-child(4)');
        if($.trim(item.text()) == 'maintenance'){
          $(item).addClass('vcl-maintenance');
        } else if ($.trim(item.text()) == 'failed'){
          $(item).addClass('vcl-failed');
        } else if ($.trim(item.text()) == 'reloading' || item.text() == 'reload'){
          $(item).addClass('vcl-reloading');
        } else if ($.trim(item.text()) == 'inuse') {
          $(item).addClass('vcl-inuse');
        }
      });
    }
  }
})(jQuery, vcl);
