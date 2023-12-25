const express = require('express');
const bodyParser = require('body-parser');
const sql = require('mssql');

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));

const config = {
    // ... your SQL Server config
};

app.post('/submit-product', async (req, res) => {
    try {
        await sql.connect(config);
        const { productID, productName, availableQuantity, pricePerUnit, supplierID } = req.body;

        // Using parameterized query to prevent SQL injection
        const query = `INSERT INTO Product (ProductID, ProductName, AvailableQuantity, PricePerUnit, SupplierID) 
                       VALUES (@productID, @productName, @availableQuantity, @pricePerUnit, @supplierID)`;

        const request = new sql.Request();
        request.input('productID', sql.Int, productID);
        request.input('productName', sql.VarChar, productName);
        request.input('availableQuantity', sql.Int, availableQuantity);
        request.input('pricePerUnit', sql.Decimal, pricePerUnit);
        request.input('supplierID', sql.Int, supplierID);

        await request.query(query);
        res.send('Product added successfully');
    } catch (err) {
        console.error(err);
        res.status(500).send('Server Error');
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
