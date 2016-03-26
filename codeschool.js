var vehicle3 = {
  type: "Submarine", capacity: 8, storedAt: "Underwater Outpost",
  ranger1: {name: "Gregg Pollack", skillz: "Lasering", dayOff: "Friday"},
  ranger2: {name: "Bijan Boustani", skillz: "Working", dayOff: "Saturday"},
  ranger3: {name: "Ashley Smith", skillz: "Torpedoing", dayOff: "Friday"},
  ranger4: {name: "Mark Krupinski", skillz: "Sniping", dayOff: "Wednesday"},
  numRangers: 4
};

function relieveDuty (vehicle, day) {
  var offDuty = [];
  var onDuty = [];
  for (var i = 0; i < vehicle.numRangers; i++) {
    if (vehicle['ranger' + (i + 1)].dayOff == day) {
    	offDuty.push(vehicle['ranger' + (i + 1)]);
    }
    else {
    	onDuty.push(vehicle['ranger' + (i + 1)]);
    }
  }

  for (var j = 0; j < vehicle.numRangers; j++) {
    delete vehicle['ranger' + (j + 1)];
  }
  vehicle.numRangers = 0;

  for (k = 0; k < onDuty.length; k++) {
  	 vehicle['ranger' + (k + 1)] = onDuty[k];
  }
  vehicle.numRangers = onDuty.lenght;

  return offDuty;
}

var offToday = relieveDuty(vehicle3, 'Friday');
