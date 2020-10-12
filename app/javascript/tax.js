function tax (){
  const itemprice  = document.getElementById("item-price");
  itemprice.addEventListener("keyup", () => {
    // if( 300 <= itemprice.value && itemprice.value <= 9999999) {
    const itempriceVal = Math.floor(itemprice.value * 0.1);
    const taxnum = document.getElementById("add-tax-price");
    taxnum.innerHTML = `${itempriceVal}`;
    const prof = itemprice.value - itempriceVal;
    const profitnum = document.getElementById("profit");
    profitnum.innerHTML = `${prof}`;
    // }
  });
}
window.addEventListener("load", tax);
