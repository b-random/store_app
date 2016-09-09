App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".alert.alert-info").show();
    $('.product-reviews').prepend(data.comment);
    refreshRating();
  },

  listen_to_comments: function() {
  return this.perform('listen', {
    product_id: $("[data-product-id]").data("product-id")
    });
  }

});

$(document).on('turbolinks:load', function() {
	App.product.listen_to_comments();
}); //makes sure listen_to_comments is called whenever the user loads the page



// This code is a little more complex but just as self-explanatory. App.product = App.cable.subscriptions.create("ProductChannel", { }); is the function that subscribes a user to a specific channel and assignes it to the variable App.product. This makes the current subscription available through App.product. Whenever this line is executed, the subscription is created, and the subscribed method in the product_channel.rb is called. So this is the JavaScript part that tells your server that a new subscriber is connected. The first part of the create method tells your app which channel to connect to. The second part is an object with a few predefined properties. connected is activated the moment a user successfully connected to the server. disconnected is the obvious counterpart. received will be executed whenever the client receives any data from the server. So in the example of a chat, this function would always be triggered when another user sends a message.