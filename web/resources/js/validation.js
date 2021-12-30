function CheckAddProduction(){

    var productId = document.getElementById("productId")
    var productName = document.getElementById("productName")
    var productInStuck = document.getElementById("productInStuck")
    var productPrice = document.getElementById("productPrice")

    if(!check(/p[0-9]{4,11}$/, productId,"[상품코드]와 숫자를 조합하여 5~12까지 입력하세요\n 첫글자는 반드시 P로 시작해야 합니다.")){
        return false
    }

    if(productName.value.length < 4 || productName.value.length > 12){
        alert("[상품명]은 최소 4~12까지 입력해주세요");
        productName.select();
        productName.focus();
        return false;
    }

    if(productPrice.value.length == 0 || isNaN(productPrice.value)){
        alert("[가격]은 숫자만 입력하세요")
        productPrice.select();
        productPrice.focus();
        return false;
    }

    if(productPrice < 0){
        alert("[가격]은 음수를 입력할 수 없습니다.")
        productPrice.select();
        productPrice.focus();
    }else if(!check(/^\d+(?:[.]?[\d]?[\d])?$/, productPrice),"[가격]은 소수점 둘째 자리까지만 입력하세요"){
        return false
    }

    if(isNaN(productInStuck.value)){
        alert("[제고]는 숫자만 입력하세요")
        productInStuck.select();
        productInStuck.focus();
        return false;
    }

    function check(regRep, e, msg){
        if(regRep.test(e.value)){
            return true;
        }

        alert(msg);
        e.select();
        e.focus();
        return false;
    }

    document.newProduct.submit()

}