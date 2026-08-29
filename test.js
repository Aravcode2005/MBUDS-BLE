
const { execSync } = require('child_process');
function statusCode(protocol, port, endpoint) {
    return execSync(`bash ./testpoints.sh ${protocol} ${port} ${endpoint}`, { encoding: 'utf8' });
}
module.exports = {
    statusCode
}