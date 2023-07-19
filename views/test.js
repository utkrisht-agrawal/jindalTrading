// Assuming you have the required tabular data in the mentioned variables

// Import the pdfmake library
// Assuming you have the required tabular data in the mentioned variables

// Import the pdfmake library
const fs = require('fs')
const pdfMake = require('pdfmake/build/pdfmake');
const pdfFonts = require('pdfmake/build/vfs_fonts');
pdfMake.vfs = pdfFonts.pdfMake.vfs;

// Define the document definition
const documentDefinition = {
  content: [
    // Row 1
    {
      columns: [
        // Table 'a'
        {
          table: {
            body: [
              ['Column 1', 'Column 2'],
              // Add your data rows for 'a' here
            ]
          }
        },
        // Table 'b'
        {
          table: {
            body: [
              ['Column'],
              // Add your data rows for 'b' here
            ]
          }
        },
        // Table 'c'
        {
          table: {
            body: [
              ['Column'],
              // Add your data rows for 'c' here
            ]
          }
        }
      ]
    },
    // Table 'd'
    {
      table: {
        body: [
          ['Column 1', 'Column 2', 'Column 3', 'Column 4', 'Column 5'],
          // Add your data rows for 'd' here
        ]
      }
    },
    // Space between tables 'd' and 'e'
    { text: '', margin: [0, 10, 0, 0] },
    // Table 'e'
    {
      table: {
        body: [
          ['Column 1', 'Column 2', 'Column 3', 'Column 4', 'Column 5', 'Column 6'],
          // Add your data rows for 'e' here
        ]
      }
    }
  ]
};

// Create a PDF document
const pdfDoc = pdfMake.createPdf(documentDefinition);

// Generate the PDF
pdfDoc.getBuffer((buffer) => {
  // Save the PDF to a file
  fs.writeFile('report.pdf', buffer, (err) => {
    if (err) {
      console.error('Error occurred while saving the PDF:', err);
    } else {
      console.log('PDF saved successfully as report.pdf');
    }
  });
});

