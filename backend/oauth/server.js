if (process.env.NODE_ENV !== 'production') require('dotenv').config();

const app = require('./app/index');
const port = process.env.PORT || 8081;

app.listen(port, () => {
  console.log(`Express server is up on port ${port}`);
});