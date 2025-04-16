function calcProfit() {
  const priceInput = document.getElementById("item-price");

  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const price = parseInt(priceInput.value);
    const taxPrice = Math.floor(price * 0.1);
    const profit = price - taxPrice;

    const taxDisplay = document.getElementById("add-tax-price");
    const profitDisplay = document.getElementById("profit");

    if (!isNaN(price) && price >= 300 && price <= 9999999) {
      taxDisplay.textContent = taxPrice;
      profitDisplay.textContent = profit;
    } else {
      taxDisplay.textContent = "";
      profitDisplay.textContent = "";
    }
  });
}

document.addEventListener("DOMContentLoaded", calcProfit);