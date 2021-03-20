const fs = require('fs');

fs.readFile('text_content.txt', 'utf8', (err, data) => {
	data = data.split(/[\.\d]+[A-Z ]+/);
	let output = {};
	let categories = [];
	data.forEach(item => {
		if (/[A-Z][A-Z]/.test(item)) {
			categories.push(item);
		}
	})
	output.data = data;
	output.categories = categories;
	fs.writeFile('./sanitize.json', JSON.stringify(output), (err) => {
		if (err) {
			console.log(err);
		} else {
			console.log("Done");

		}
	})
})