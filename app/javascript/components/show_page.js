// // $(document).ready(function(){

//   var performance = {
//     '<0': 'performancedev-neg'
//     '>=0': 'performancedev-pos'
//   }

const percentageColouring = () => {
  const percentages = document.querySelectorAll(".pos-neg");
  if (percentages.length > 0) {
    console.log("it works");
    percentages.forEach((percentage) => {
      var numberStr = percentage.innerText
      if (numberStr.includes("-")){
        percentage.classList.add("performancedev-neg")
      } else {
        percentage.classList.add("performancedev-pos")
      }
    })
  }
}

export { percentageColouring }
