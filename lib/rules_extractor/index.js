let fs = require('fs'),
	PDFParser = require("pdf2json");

let pdfParser = new PDFParser();

pdfParser.on("pdfParser_dataError", errData => console.error(errData.parserError));
pdfParser.on("pdfParser_dataReady", async pdfData => {
	let content = "";
	let data = pdfData;

	data.formImage.Pages.forEach(page => {
		page.Texts.forEach(text => {
			text["R"].forEach(r => {
				content += decodeURIComponent(r["T"])
			})
		})
	})

	await fs.writeFileSync("./text_content.txt", content);
	await fs.writeFileSync("./extract.json", JSON.stringify(data));
});

pdfParser.loadPDF("./rules_reference.pdf");