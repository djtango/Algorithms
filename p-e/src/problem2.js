function EvenFibs() {

};

EvenFibs.prototype.genFibs = function(limit){
  var fibNums = []
  for(i = 0; i < limit; i++) {
      if (i == 0) {
        fibNums.push(1)
      } else if (i == 1) {
        fibNums.push(2)
      } else {
        fibNums.push(fibNums[i-2] + fibNums[i-1])
      };
    };
  return fibNums;
};

