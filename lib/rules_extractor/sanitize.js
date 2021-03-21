const fs = require('fs');

fs.readFile('rules_reference_accessible.txt', 'utf8', (err, data) => {
	if (err) {
		console.log(err)
	} else {
		let rules = [];
		let category = {};
		let sub_text = [];
		let sanitized_data = [];
		let started = false;
		data = data.split("\r\r");

		for (let i = 0; i < data.length; i++) {
			data[i] = data[i].replace(/(\r|\f)/igm, "");
			if (data[i] == "") {
				data.splice(i, 1);
				i--;
			}
		}



		// for (let i = 0; i < data.length; i++) {
		// 	let arr = [];
		// 	let indexes = data[i].match(/[\d]+\.[\d]+/g);
		// 	if (indexes) {
		// 		for (let n = 0; n < indexes.length; n++) {
		// 			let indexOfNext = (typeof indexes[n + 1] != "undefined") ? data[i].indexOf(indexes[n + 1]) : data[i].length;
		// 			arr.push(data[i].substr(data[i].indexOf(indexes[n]), indexOfNext));
		// 		}
		// 	}

		// 	if (arr.length) {
		// 		data.splice(i, 1, ...arr);
		// 		i += arr.length + 1;
		// 	}
		// }



		data.forEach(item => {
			// console.log("Building " + data.indexOf(item) + " of " + data.length)
			if (started) {
				if (/^[\d]+ [A-Z]+/.test(item)) {
					category.sub_text = sub_text;
					rules.push(category);
					category = {};
					sub_text = [];
					category.title = item;
				} else {
					sub_text.push(item);
				}

			} else {
				if (/^1 [A-Z]+/.test(item)) {
					category.title = item;
					started = true;
				}
			}
		})

		fs.writeFile('rules_data.json', JSON.stringify(rules), (err) => {
			if (err) {
				console.log(err);
			} else {
				console.log("Done");
			}
		})
	}

})