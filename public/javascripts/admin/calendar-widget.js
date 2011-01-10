(function($) {

var dni=new Array();
var now = new Date();
var thisday = now.getDate();
var thismonth = now.getMonth();
var thisyear = now.getYear() + 1900;
var opts = {
month: thismonth,
year: thisyear,
startDay:1,
output: false,
events:false
};

function calendarWidget(el, params) {



$.extend(opts, params);

dni = opts.output.val().split(';');
//dni.pop();
if (dni[dni.length-1].length === 0) dni.pop();

var monthNames = ['Styczeń', 'Luty', 'Marzec', 'Kwiecień', 'Maj', 'Czerwiec', 'Lipiec', 'Sierpień', 'Wrzesień', 'Październik', 'Listopad', 'Grudzień'];
var dayNames = ['Pn', 'Wt', 'Śr', 'Czw', 'Pt', 'Sb','Nd'];
month = i = parseInt(opts.month,10);
year = parseInt(opts.year);
var m = 0;
var table = $('<table></table>');

// next month
if (month == 11) {
var next_month = '<a href="?month=' + 1 + '&amp;year=' + (year + 1) + '" title="' + monthNames[0] + ' ' + (year + 1) + '">' + monthNames[0] + ' ' + (year + 1) + '</a>';
} else {
var next_month = '<a href="?month=' + (month + 2) + '&amp;year=' + (year) + '" title="' + monthNames[month + 1] + ' ' + (year) + '">' + monthNames[month + 1] + ' ' + (year) + '</a>';
}

// previous month
if (month == 0) {
var prev_month = '<a href="?month=' + 12 + '&amp;year=' + (year - 1) + '" title="' + monthNames[11] + ' ' + (year - 1) + '">' + monthNames[11] + ' ' + (year - 1) + '</a>';
} else {
var prev_month = '<a href="?month=' + (month) + '&amp;year=' + (year) + '" title="' + monthNames[month - 1] + ' ' + (year) + '">' + monthNames[month - 1] + ' ' + (year) + '</a>';
}

$(table).append($('<h3 id="current-month">'+monthNames[month]+' '+year+'</h3>'));
// uncomment the following lines if you'd like to display calendar month based on 'month' and 'view' paramaters from the URL
//table += ('<div class="nav-prev">'+ prev_month +'</div>');
//table += ('<div class="nav-next">'+ next_month +'</div>');
$(table).append($('<table class="calendar-month " ' +'id="calendar-month'+i+' " cellspacing="0">'));

var tr=$('<tr></tr>');

for (d=0; d<7; d++) {

$(tr).append($( '<th class="weekday">' + dayNames[d] + '</th>'));
}
$(table).append(tr);


var days = getDaysInMonth(month,year);
var firstDayDate=new Date(year,month,1);
var firstDay=firstDayDate.getDay();

var prev_days = getDaysInMonth(month,year);
var firstDayDate=new Date(year,month,0);
var firstDay=firstDayDate.getDay();

var prev_m = month == 0 ? 11 : month-1;
var prev_y = prev_m == 11 ? year - 1 : year;
var prev_days = getDaysInMonth(prev_m, prev_y);
firstDay = (firstDay == 0 && firstDayDate) ? 7 : firstDay;

var i = 0;

var tr=$('<tr></tr>');
for (j=0;j<42;j++){

if ((j<firstDay)){

var td=$('<td class="other-month"><span class="day">'+ (prev_days-firstDay+j+1) +'</span></td>');
} else if ((j>=firstDay+getDaysInMonth(month,year))) {
i = i+1;
var td=$('<td class="other-month"><span class="day">'+ i +'</span></td>');
}else{
var td=$ ('<td class="current-month day'+(j-firstDay+1)+'"><span class="day">'+(j-firstDay+1)+'</span></td>');
if (findDay((j-firstDay+1)+"-"+(month +1 )+"-"+year).length > 0 ){
$(td).addClass('day-selected');
}

}

if ((j-firstDay+1)==now.getDate()&&month==now.getMonth()) $(td).addClass('current-day');
if ($(td).hasClass('current-month')) td.bind('click', function(){
if ($(this).hasClass('day-selected')) {
$(this).removeClass('day-selected')
var removeItem=$(this).text()+'-'+(month +1 )+'-'+year;
dni = jQuery.grep(dni, function(value) {
// return value != removeItem;
 return removeItem != $.map(value.split('-'),function(val){ return parseInt(val,10)}).join('-');
});
} else {
$(this).addClass('day-selected')
dni.push($(this).text()+'-'+(month +1 )+'-'+year)
}
$(opts.output).val('');
for (var i=0; i< dni.length; i++){
$(opts.output).val($(opts.output).val()+dni[i]+';')
}
})
$(tr).append(td);
$(td).addClass('week-day-'+(j%7))

if (j%7==5) {
$(td).addClass('day-saturday')

}
if (j%7==6) {
$(td).addClass('day-sunday')
$(td).addClass('calendar-last-column')
$(table).append(tr);
var tr=$('<tr></tr>');
}


  }
$(el).append(table);




}

function findDay(dzien){
var eventy = $.grep(dni, function(value){
  // return dzien == value;
//return dzien == $.map(value.split('-'),function(val){ return parseInt(val)}).join('-');
return dzien == $.map(value.split('-'),function(val){ return parseInt(val,10)}).join('-');
});
return eventy;
}

function getDaysInMonth(month,year) {
var daysInMonth=[31,28,31,30,31,30,31,31,30,31,30,31];
if ((month==1)&&(year%4==0)&&((year%100!=0)||(year%400==0))){
return 29;
}else{
return daysInMonth[month];
}
}


// jQuery plugin initialisation
$.fn.calendarWidget = function(params) {
calendarWidget(this, params);
return this;
};
})(jQuery);


