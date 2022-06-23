const showValue = (target) => {
  const value = target.value;
  const text =  target.options[target.selectedIndex].text;
  
  document.querySelector(`div`).innerHTML = `text: ${text} value: ${value}`;
}