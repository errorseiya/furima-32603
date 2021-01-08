window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    // console.log(addTaxDom);
    // 引数として与えられている()内の計算式の結果の小数点以下を切り捨ててくれます

    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue * 0.9);
  })
});

