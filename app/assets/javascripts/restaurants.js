$(document).ready(function(){

  updateOrderSummary();

  $('.add-to-cart').on('click', function(e){
    var target = $(e.target);
    $("#cart-box").modal({
      minWidth: 550, minHeight: 180
    });
    setForm('cart-box', target.data('id'), target.data('name'), 
      target.data('price'), target.data('currency'));
  });

  $('#order_button').on('click', function(e){
    e.preventDefault();
    var products = setProducts(toProduct(e.target.form));
    $.cookie('products', JSON.stringify(products), { expires: 1 });
    updateOrderSummary();
    $.modal.close();
  });

  $("#update_order_button").on('click', function(e){
    e.preventDefault();
    var product = toProduct(e.target.form);
    var products = setProducts(product, true, product.random);
    $.cookie('products', JSON.stringify(products), { expires: 1 });
    updateOrderSummary();
    $.modal.close();
  });

  $(document).on('click', "i.icon-edit", function(e){
    e.preventDefault();
    var target = $(e.target);
    var product = getProductsByRandom(target.data('random'));
    $("#update-cart-box").modal({ minWidth: 550, minHeight: 180 });
    setForm('update-cart-form',product.id, product.name, product.price, 
      product.currency, product.instruction, product.quantity, product.random);
  });

  function setForm(formId, id, name, price, currency, instruction, quantity, random) {
    var form = null;
    
    if(formId == 'cart-box') {
      form = document.getElementById('cart-form');
      $('#span-cart-box-1').html(name || "");
      $('#span-cart-box-2').html(currency || "");
    }
    else {
      form = document.getElementById('update-cart-form');
      $('#span-cart-box-3').html(name || "");
      $('#span-cart-box-4').html(currency || "");
    } 

    form.elements['product_id'].value = id
    form.elements['product_name'].value = name
    form.elements['product_price'].value = price
    form.elements['product_currency'].value = currency
    form.elements['instruction'].value = instruction || "";
    form.elements['quantity'].value = quantity || "";
    form.elements['random'].value = random || "";
  } 

  $(document).on('click', "i.icon-remove", function(e){
    e.preventDefault();
    var target = $(e.target);
    if(confirm('are you sure to remove this item ?')) {
      removeProducts(target.data('random'));      
    }
    updateOrderSummary();
  });


  function checkCart() {
    var products = getProducts();
    if(products.length === 0) {
      $("#blank").show();
      $("ul#product-list").hide();
      $("#checkout_button").hide();
      $("#total-summary").hide();
    }
    else {
      $("#blank").hide();
      $("#checkout_button").show();
      $("#product-list").show();
      $("#total-summary").show();
    }
  }

  function getProducts() {
    var products = $.cookie('products');
    if(products == undefined) {
      return [];
    }
    else {
      return $.parseJSON(products)
    }
  }

  function removeProducts(random){
    var products = getProducts();
    var found = false;
    var index = 0;
    for(var i=0;i<products.length;i++){
      if(products[i].random == random) {
        found = true;
        index = i;
        break;
      }
    }
    if(found) {
      products.splice(index, 1);
    }
    $.cookie('products', JSON.stringify(products));
  }

  function getProductsByRandom(random) {
    var products = getProducts();
    product = null;
    for(var i=0;i<products.length;i++) {
      if(products[i].random == random) {
        product = products[i];
        break;
      }      
    }
    return product;
  }

  function setProducts(product, update, random){
    var products = getProducts();
    if(update) {
      for(var i=0;i<products.length;i++){
        if(products[i].random == random) {
          products[i] = product;
          break;
        }
      }
    }
    else {
      products.push(product);
    }    
    return products;  
  }

  function toProduct(form) {
    return {
      id: form.elements['product_id'].value,
      name: form.elements['product_name'].value,
      price: form.elements['product_price'].value,
      currency: form.elements['product_currency'].value,
      instruction: form.elements['instruction'].value,
      quantity: form.elements['quantity'].value,
      random: form.elements['random'].value || Math.random()
    };
  }

  function updateOrderSummary() {
    checkCart();
    var products = getProducts();
    if(products.length != 0) {
      var ul = $("#product-list");
      var quantity = 0;
      var totalOrder = 0;
      var subTotal = 0;
      var deliveryFee = 10000;
      var tax = 0;
      var total = 0;

      ul.empty();
      getProducts().forEach(function(product, i){        
        var element = $("<li></li>");
        element.append($('<span class="number">' + product.quantity + '. </span>'));
        element.append($('<span class="product-name">' + product.name + '</span>'));
        element.append($('<span class="price">' + product.currency + '</span>'));
        element.append($('<span class="edit"><a href="#"><i class="icon-edit" data-random="' 
          + product.random +'"></i></a></span>'));
        element.append($('<span class="remove"><a href="#"><i class="icon-remove" data-random="' 
          + product.random +'"></i></a></span>'));
        ul.append(element);        
        quantity += parseInt(product.quantity);
        subTotal += parseFloat(product.price) * parseInt(product.quantity);
      });

      tax = subTotal / 100 * 10; 
      total = subTotal + deliveryFee + tax;

      $("#span-quantity").html(quantity);
      $("#span-subtotal").html(toCurrency(subTotal));
      $("#span-charge").html(toCurrency(tax));
      $("#span-delivery").html(toCurrency(deliveryFee));
      $("#span-total").html(toCurrency(total));
      $("#checkout_button").show();
    }
  }

  function toCurrency(amount) {
    return "Rp. " + parseFloat(amount);
  }

    for (var i=0; i < products .length;i++) {console.log(products[i].name + 'dengan ID:' + products[i].id + 'Harganya adalah :' + products[i].price);} 

    $('#checkout_button').on('click', function(e){
    var target = $(e.target);
    $.cookie(products);
    $('#product_id').val(products[i].id)



    });
    // setForm('cart-box', target.data('id'), target.data('name'), 
    //   target.data('price'), target.data('currency'));
  });

});