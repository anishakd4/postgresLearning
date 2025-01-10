
//Whenever we get back any kind of result from our database, we should be able to always easily parse that data, fix all the casing, and never inside of any of our JavaScript code should we ever have to use that kind of underscore casing at any point in time.
module.exports = (rows) => {
    return rows.map((row) => {
        const replaced = {};
        for(let key in row) {
            const camelCase = key.replace(/([-_][a-z])/gi, ($1) =>
                $1.toUpperCase().replace('_', '')
            );
            replaced[camelCase] = row[key];
        };

        return replaced;
    })
}