
function tax (){
  const itemprice  = document.getElementById("item-price");
  itemprice.addEventListener("keyup", () => {
    const itempriceVal = Math.floor(itemprice.value * 0.1);
    const taxnum = document.getElementById("add-tax-price");
    taxnum.innerHTML = `${itempriceVal}`;
    const prof = itemprice.value - itempriceVal;
    const profitnum = document.getElementById("profit");
    profitnum.innerHTML = `${prof}`;
  });
}
window.addEventListener("keypress", tax);
