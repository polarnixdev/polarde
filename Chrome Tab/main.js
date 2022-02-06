function checkTime(i) {
  if (i < 10) {
    i = "0" + i;
  }
  return i;
}

function startTime() {
  var today = new Date();
  var h = today.getHours();
  var m = today.getMinutes();
  var s = today.getSeconds();

  var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  var d = today.getDay();
  var dayName = days[d];

  var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  var month = today.getMonth();
  var monthName = months[month];

  var monthDay = today.getDate();
  // console.log(monthDay);

  const year = today.getFullYear();
  // console.log(year);

  // add a zero in front of numbers<10
  m = checkTime(m);
  s = checkTime(s);

  document.getElementById('time').innerHTML = h + ":" + m;
  document.getElementById('dayName').innerHTML = dayName;
  document.getElementById('monthDay').innerHTML = monthDay;
  document.getElementById('monthName').innerHTML = monthName;
  document.getElementById('year').innerHTML = year;

  t = setTimeout(function() {
    startTime()
  }, 500);
}
startTime();
