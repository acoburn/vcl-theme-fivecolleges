(function($, Backbone, _) {
  $(function () {
    var App = {}
      , View = {}
      , Model = {}
      ;

    // Model.Context
    // -------------
    Model.Context = Backbone.Model.extend({
      defaults: {
        section: null
      },
      template: function() {
        if(this.get('section')) {
          return '/help/templates/' + this.get('section') + '.html';
        } else {
          return '/help/templates/home.html';
        }
      }
    }); // Model.Context

    // View.Main
    // ---------
    View.Main = Backbone.View.extend({
      initialize: function() {
        App.context.on('change:section', this.render, this);
      },
      render: function() {
        var el = this.$el;
        $(el).html('');
        $.get(App.context.template(), function (data) {
          $(el).html(_.template(data));
        });
      },
      events: {
        'click a.internal': function(evt) {
          App.context.set({section: $(evt.currentTarget).attr('href').replace(/^#/, '')});
          return false;
        }
      }
    }); // View.Main

    // View.Navigation
    // ---------------
    View.Navigation = Backbone.View.extend({
      initialize: function() {
        App.context.on('change:section', this.render, this);
      },
      render: function() {
        this.$('a').parent().removeClass('active');
        this.$('a.' + App.context.get('section')).parent().addClass('active');
      },
      events: {
        'click a': function(evt) {
          App.context.set({section: $(evt.currentTarget).attr('href').replace(/^#/, '')});
          return false;
        }
      }
    }); // View.Navigation

    App.context = new Model.Context();
    App.nav = new View.Navigation({el: '.vcl-help-nav'});
    App.main = new View.Main({el: '.vcl-help-content'});
    App.context.set({section: 'home'});
  });
})(jQuery, Backbone, _.noConflict());
