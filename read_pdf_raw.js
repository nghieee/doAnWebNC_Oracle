const fs = require('fs');
let pdf = require('pdf-parse');

let parseFn = null;
let isClass = false;
if (typeof pdf === 'function') {
    parseFn = pdf;
} else if (pdf.PDFParse) {
    parseFn = pdf.PDFParse;
    isClass = true;
} else if (pdf.default) {
    parseFn = pdf.default;
}

console.log("pdf-parse type:", typeof parseFn, "isClass:", isClass);

let dataBuffer = fs.readFileSync('d:\\DoAnCaNhan\\doAnWebNC_Oracle\\docs\\CHQTCSDL\\2026- HQTCSDL-Huong dan thuc hien de tai.pdf');

let result;
if (isClass) {
    result = new parseFn(dataBuffer);
} else {
    result = parseFn(dataBuffer);
}

// Check if result is a promise
if (result && typeof result.then === 'function') {
    result.then(function(data) {
        fs.writeFileSync('C:\\Users\\nowrg\\.gemini\\antigravity-ide\b\\brain\\0366a041-3b40-4fdb-a619-42bfe60a0874\\scratch\\pdf_text_extracted.txt', data.text || JSON.stringify(data));
        console.log("Success! Extracted text size: " + (data.text ? data.text.length : JSON.stringify(data).length));
    }).catch(err => {
        console.error("Error in promise:", err);
    });
} else {
    console.log("Result is not a promise. Keys:", Object.keys(result));
    console.log("Result string:", result.toString());
}
