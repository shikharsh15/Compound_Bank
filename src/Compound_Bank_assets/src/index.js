import { Compound_Bank } from "../../declarations/Compound_Bank";

async function update() {
  const balance = await Compound_Bank.checkBalance();
  document.getElementById('value').innerText = balance.toFixed(2);
}

window.addEventListener("load", update);

document.querySelector("form").addEventListener("submit", async (event) => {
  event.preventDefault();
  const button = event.target.querySelector("#submit-btn");
  const topUpValue = parseFloat(event.target[0].value);
  const withdrawalAmount = parseFloat(event.target[1].value);
  button.setAttribute("disabled", true);

  if (topUpValue) {
    await Compound_Bank.topUp(topUpValue);
  }

  if (withdrawalAmount) {
    await Compound_Bank.withdrawl(withdrawalAmount);
  }
  await Compound_Bank.getInterest();
  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";
  update();

  button.removeAttribute("disabled");
});
