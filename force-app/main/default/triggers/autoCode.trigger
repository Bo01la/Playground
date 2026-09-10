trigger autoCode on Product2 (before Insert) {
    for(Product2 pro: Trigger.new){
        if(pro.ProductCode != null && pro.ProductCode != ''){
        pro.ProductCode = 'BOL-' + pro.ProductCode;
        }
    }
}