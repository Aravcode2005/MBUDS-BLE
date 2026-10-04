require('dotenv').config();
const statusCode = require('./test');

const Endpoints = [
    '', 'moodbudsv1/signup', 'moodbudsv1/verifyotp', 'moodbudsv1/profilecreation'
]
for (let i = 0; i < Endpoints.length; i++) {
    test('Health route', () => {
        expect(Number(statusCode('http', process.env.PORT, Endpoints.at(i)))).toBe(200);
    })
}
