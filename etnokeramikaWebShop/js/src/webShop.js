function ShowCartFpContainer(src) {
    var top = (src == 'cartButton' ? $('#btnCartFp').offset().top + $('#btnCartFp').height() : $(window).scrollTop());
    var right = $(window).width() - ($('#btnCartFp').offset().left + $('#btnCartFp').width());
    $('#cartFpContainer').css({ top: top, right: right });
    $('#cartFpContainer').show();

    GetCartItems();
}

function AddToCart(lblProductID) {
    var productID = parseInt($('#' + lblProductID).val());
    
    $.ajax({
        type: 'POST',
        url: '/WebMethods.aspx/AddToCart',
        data: JSON.stringify({ 'productID': productID }),
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        success: function (response) {
            ShowCartFpContainer('productFp');
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(jqXHR.responseText);
        }
    })
    
}

function GetCartItems() {
    $.ajax({
        type: 'POST',
        url: 'WebMethods.aspx/GetCart',
        data: '',
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        success: function (response) {
            $('#tblCartItems tr').remove();
            $.get('/jQueryTemplates/cartFPTemplate.html', null, function (cartTemplate) {
                $.tmpl(cartTemplate, JSON.parse(response.d)).appendTo('#tblCartItems');
            })
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(jqXHR.responseText);
        }
    })
}

//document
$(window).scroll(function () {
    if($('#cartFpContainer').is(':visible')){
        var scrollTop = $(window).scrollTop();
        var btnCartFpTop = $('#btnCartFp').offset().top + $('#btnCartFp').height();
        $('#cartFpContainer').css({ top: scrollTop > btnCartFpTop ? scrollTop : btnCartFpTop });
    }
})

$(document).click(function (e) {
    if ($('#cartFpContainer').is(':visible') && e.target.id != 'btnCartFp') {
        $('#cartFpContainer').hide();
    }
})