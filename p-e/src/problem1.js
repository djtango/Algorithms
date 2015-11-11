function consecSum(limit) {
  return (limit + 1) * limit / 2
}

function highestMultiple(limit, multiple) {
  return Math.floor(limit / multiple)
}

function sumOfMultiples(limit, multiple) {
  return consecSum(highestMultiple(limit, multiple)) * multiple
}

sumOfMultiples(999,3) + sumOfMultiples(999,5) - sumOfMultiples(999,15)