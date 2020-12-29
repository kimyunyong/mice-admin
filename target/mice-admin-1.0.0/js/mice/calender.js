function fillZero(value, length) {
	var result = "" + value;

	for( var step = result.length; step < length; step++ ) {
		result = "0" + result;
	}

	return result;
}

function Calendar(returndate) {
	//this.date = new Date();
	this.date = new Date(returndate);

	this.set = function(newDate) {
		this.date = newDate;
	};
	
	this.get = function() {
		return this.date;
	};
	
	this.getLongTime = function() {
		return this.date.getTime();
	};
	
	this.setLongTime = function(millisec) {
		return this.date.setTime(millisec);
	};

	this.addDay = function( day ) {
		this.setLongTime(this.getLongTime() + day * 86400000);
	}
	this.minusDay = function( day ) {
		this.setLongTime(this.getLongTime() - day * 86400000);
	}
	
	this.getYear = function() {
		return this.date.getFullYear();
	};
	
	this.setYear = function(year) {
		this.date.setFullYear(year);
	};
	
	this.getMonth = function() {
		return this.date.getMonth()+1;
	};
	
	this.setMonth = function(month) {
		this.date.setMonth(month);
	};
	
	this.getDayOfMonth = function() {
		return this.date.getDate();
	};
	
	this.setDayOfMonth = function(dayOfMonth) {
		this.date.setDate(dayOfMonth);
	};
	
	this.getDayOfWeek = function() {
		return this.date.getDay();
	};
	
	this.setDayOfWeek = function(dayOfWeek) {
		this.addDay(this.getDayOfWeek() * -1);
		this.addDay(dayOfWeek);
	};	
	
	this.setDate = function( year, month, dayOfMonth ) {
		this.setYear(year);
		this.setMonth(month);
		this.setDayOfMonth(dayOfMonth);
	};

	this.getDate = function() {
		return this.getYear() + "-" + fillZero((this.getMonth()), 2) + "-" + fillZero(this.getDayOfMonth(), 2);
	};


	this.getHours = function() {
		return this.date.getHours();
	};
	
	this.setHours = function(hours) {
		this.date.setHours(hours);
	};
	
	this.getMinutes = function() {
		return this.date.getMinutes();
	};
	
	this.setMinutes = function(minutes) {
		this.date.setMinutes(minutes);
	};
	
	this.getSeconds = function() {
		return this.date.getSeconds();
	};
	
	this.setSeconds = function(seconds) {
		this.date.setSeconds(seconds);
	};

	this.getMilliseconds = function() {
		return this.date.getMilliseconds();
	};

	this.setMilliseconds = function(seconds) {
		this.date.setMilliseconds(seconds);
	};
	
	this.setTime = function( hour, minute, second) {
		this.setHours(hour);
		this.setMinutes(minute);
		this.setSeconds(second);
		this.setMilliseconds(0);
	};

	this.getTime = function() {
		return fillZero(this.getHours(),2) + ":" + fillZero(this.getMinutes(), 2)  + ":" + fillZero(this.getSeconds(), 2);
	};	

	this.getDateTime = function() {
		return this.getDate() + " " + this.getTime();
	};

	this.format = function(format) {
		var result = format;

		result = result.replace( "yyyy", this.getYear() );
		result = result.replace( "yy", this.getYear() % 100 );
		result = result.replace( "MM", fillZero(this.getMonth(),2));
		result = result.replace( "M", this.getMonth());
		result = result.replace( "dd", fillZero(this.getDayOfMonth(),2));
		result = result.replace( "d", this.getDayOfMonth());
		result = result.replace( "a", this.getHours() > 12 ? "PM" : "AM");
		result = result.replace( "HH", fillZero(this.getHours(), 2));
		result = result.replace( "H", this.getHours());
		result = result.replace( "hh", fillZero(this.getHours() == 0 || this.getHours() == 12 ? 12 : this.getHours() % 12, 2));
		result = result.replace( "h", this.getHours() == 0 || this.getHours() == 12 ? 12 : this.getHours() % 12 );
		result = result.replace( "mm", fillZero(this.getMinutes(), 2));
		result = result.replace( "m", this.getMinutes());
		result = result.replace( "ss", fillZero(this.getSeconds(), 2));
		result = result.replace( "s", this.getSeconds());
		return result;
	};

	this.parseDate = function(dateString) {
		if( dateString == null || dateString.length <= 0 ) {
			return false;
		}

		var dateItem = dateString.split("-");

		if( dateItem.length < 3 ) {
			return false;
		}

		var year = parseInt(dateItem[0]);
		var month = parseInt(dateItem[1]);
		var day = parseInt(dateItem[2]);

		if( isNaN(year) == true || isNaN(month) == true || isNaN(day) == true ) {
			return false;
		}

		this.setDate(year, month-1, day);
		return true;
	}	

	this.parseTime = function(timeString) {
		if( timeString == null || timeString <= 0 ) {
			return false;
		}

		var timeItem= timeString.split(":");

		if( timeItem.length < 3 ) {
			return false;
		}

		var hour = parseInt(timeItem[0]);
		var minute = parseInt(timeItem[1]);
		var second = parseInt(timeItem[2]);

		if( isNaN(hour) == true || isNaN(minute) == true || isNaN(second) == true ) {
			return false;
		}

		this.setTime(hour, minute, second);
		return true;
	}

	this.parse = function(dateTimeString) {
		if( dateTimeString == null || dateTimeString <= 0 ) {
			return false;
		}

		var dateTimeItem= dateTimeString.split(" ");

		if( dateTimeItem.length < 2 ) {
			return false;
		}

		if( this.parseDate(dateTimeItem[0]) == false || this.parseTime(dateTimeItem[1]) == false ) {
			return false;
		}

		return true;
	}
}