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
					category.title = item.match(/^[\d]+ [A-Z ()]+/)[0].trim();
					category.number = item.match(/^[\d]+/igm)[0];
					category.title = category.title.replace(/^[\d]+ /, "")
				} else {
					sub_text.push(item);
				}

			} else {
				if (/^1 [A-Z]+/.test(item)) {
					category.title = item.match(/^[\d]+ [A-Z ()]+/)[0].trim();
					category.number = item.match(/^[\d]+/igm)[0];
					category.title = category.title.replace(/^[\d]+ /, "")
					started = true;
				}
			}
		})

		let match_re = /[\d]+\.[\d]+/igm;

		for (let r = 0; r < rules.length; r++) {
			let items_to_add_to_sub_lines = [];
			for (let s = 0; s < rules[r].sub_text.length; s++) {
				if (match_re.test(rules[r].sub_text[s])) {

					let cases = rules[r].sub_text[s].match(match_re);
					if (cases) {
						for (let c = 0; c < cases.length; c++) {
							let case_str = "";
							let upperIndex = (typeof cases[c + 1] != "undefined") ? rules[r].sub_text[s].indexOf(cases[c + 1]) : rules[r].sub_text[s].length;
							case_str = rules[r].sub_text[s].substr(rules[r].sub_text[s].indexOf(cases[c]), upperIndex);
							items_to_add_to_sub_lines.push(case_str);
						}
					}
				} else {
					items_to_add_to_sub_lines.push(rules[r].sub_text[s]);
				}
			}

			rules[r].sub_text = [];
			rules[r].sub_text.push(...items_to_add_to_sub_lines);
		}

		fs.writeFile('rules_data.json', JSON.stringify(rules), (err) => {
			if (err) {
				console.log(err);
			} else {
				console.log("Done");
				fs.writeFile('rules-reference-data.dart',
					`List<Map> rules = ` + JSON.stringify(rules) + ';', err => { })
			}
		})
	}

})